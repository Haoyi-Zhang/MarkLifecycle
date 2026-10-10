#!/usr/bin/env bash
set -euo pipefail
export PYTHONDONTWRITEBYTECODE=1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROFILE="${TSE01_PROFILE:-auto}"
SCOPE="all"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --root) ROOT="$(cd "$2" && pwd)"; shift 2 ;;
    --profile) PROFILE="$2"; shift 2 ;;
    --scope) SCOPE="$2"; shift 2 ;;
    -h|--help)
      cat <<'EOF'
usage: artifact/run_all.sh [--root PROJECT_ROOT] [--profile auto|full|review]
                           [--scope all|models|finite|project|paper|verify|smoke]
EOF
      exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done
if [[ ! -d "$ROOT/artifact" || ! -d "$ROOT/paper" ]]; then
  echo "project root must contain sibling artifact/ and paper/ directories: $ROOT" >&2
  exit 2
fi
if [[ "$SCOPE" == "smoke" ]]; then
  if [[ "${TSE01_SMOKE_CHILD:-0}" == "1" ]]; then
    python3 "$ROOT/artifact/src/test_entrypoint_paths.py" --root "$ROOT" --self-check
  else
    python3 "$ROOT/artifact/src/test_entrypoint_paths.py" --root "$ROOT"
  fi
  exit 0
fi
if [[ "$PROFILE" == "auto" ]]; then
  if [[ "$(basename "$ROOT")" == "TSE-01-REVIEW-PACKET" || -f "$ROOT/REVIEW_PACKET_MANIFEST.json" ]]; then
    PROFILE="review"
  else
    PROFILE="full"
  fi
fi
if [[ "$PROFILE" != "full" && "$PROFILE" != "review" ]]; then
  echo "unsupported profile: $PROFILE" >&2; exit 2
fi
if [[ ! "$SCOPE" =~ ^(all|models|finite|project|paper|verify)$ ]]; then
  echo "unsupported scope: $SCOPE" >&2; exit 2
fi

find "$ROOT" -type d -name __pycache__ -prune -exec rm -rf {} +
rm -f \
  "$ROOT/paper/main.aux" "$ROOT/paper/main.bbl" "$ROOT/paper/main.blg" \
  "$ROOT/paper/main.log" "$ROOT/paper/main.out" "$ROOT/paper/main.fls" \
  "$ROOT/paper/main.fdb_latexmk" "$ROOT/paper/main.synctex.gz"

# Validate the delivery evidence before any rebuilding can replace it.
if [[ "$SCOPE" == "all" || "$SCOPE" == "finite" || "$SCOPE" == "verify" ]]; then
  python3 "$ROOT/artifact/src/verify_retained_outputs.py" --root "$ROOT" \
    --report artifact/results/retained_output_closure.json
fi

if [[ "$PROFILE" == "review" && "$SCOPE" == "all" ]]; then
  rm -f "$ROOT/REVIEW_PACKET_MANIFEST.json"
fi

if [[ "$SCOPE" == "all" || "$SCOPE" == "models" ]]; then
  python3 "$ROOT/artifact/gate-model/src/run_gate_model.py" --root "$ROOT"
  python3 "$ROOT/artifact/gate-model/src/independent_recheck.py" --root "$ROOT"
fi
if [[ "$SCOPE" == "all" || "$SCOPE" == "finite" ]]; then
  python3 "$ROOT/artifact/src/run_experiments.py" --root "$ROOT"
  python3 "$ROOT/artifact/src/independent_recheck.py" --root "$ROOT"
fi
if [[ "$SCOPE" == "all" || "$SCOPE" == "project" ]]; then
  python3 "$ROOT/artifact/commit-replay/src/run_commit_replay.py" --root "$ROOT"
  python3 "$ROOT/artifact/commit-replay/src/independent_recheck.py" --root "$ROOT"
  python3 "$ROOT/artifact/commit-replay/src/test_source_parser_security.py" --root "$ROOT"
  python3 "$ROOT/artifact/commit-replay/src/test_publication_protocol.py" --root "$ROOT"
  python3 "$ROOT/artifact/upstream-validation/src/run_validation.py" --root "$ROOT"
  python3 "$ROOT/artifact/upstream-validation/src/independent_recheck.py" --root "$ROOT"
fi
if [[ "$SCOPE" == "all" || "$SCOPE" == "paper" ]]; then
  "$ROOT/paper/compile.sh"
  python3 "$ROOT/paper/verify_reference_lock.py" --paper "$ROOT/paper"
fi
if [[ "$SCOPE" == "all" || "$SCOPE" == "verify" ]]; then
  TSE01_ROOT="$ROOT" TSE01_PROFILE="$PROFILE" python3 "$ROOT/artifact/src/make_release_materials.py"
  find "$ROOT" -type d -name __pycache__ -prune -exec rm -rf {} +
  if [[ "$PROFILE" == "review" ]]; then
    python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile review --skip-review-manifest
    python3 "$ROOT/artifact/src/build_review_manifest.py" --root "$ROOT"
    python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile review
  else
    python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile full
  fi
fi
