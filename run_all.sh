#!/usr/bin/env bash
set -euo pipefail
export PYTHONDONTWRITEBYTECODE=1
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROFILE="${TSE01_PROFILE:-auto}"
if [[ "$PROFILE" == "auto" ]]; then
  if [[ "$(basename "$ROOT")" == "TSE-01-REVIEW-PACKET" || -f "$ROOT/REVIEW_PACKET_MANIFEST.json" ]]; then
    PROFILE="review"
  else
    PROFILE="full"
  fi
fi
if [[ "$PROFILE" != "full" && "$PROFILE" != "review" ]]; then
  echo "unsupported TSE01_PROFILE=$PROFILE; expected auto, full, or review" >&2
  exit 2
fi

find "$ROOT" -type d -name __pycache__ -prune -exec rm -rf {} +
rm -f "$ROOT/paper/main.aux" "$ROOT/paper/main.bbl" "$ROOT/paper/main.blg" \
      "$ROOT/paper/main.log" "$ROOT/paper/main.out" "$ROOT/paper/main.fls" \
      "$ROOT/paper/main.fdb_latexmk" "$ROOT/paper/main.synctex.gz"

# A frozen review packet is intentionally self-rebuilding.  Remove its derived
# top-level manifest before the closed-set release and review manifests are
# regenerated from the newly executed evidence.
if [[ "$PROFILE" == "review" ]]; then
  rm -f "$ROOT/REVIEW_PACKET_MANIFEST.json"
fi

python3 "$ROOT/artifact/gate-model/src/run_gate_model.py" --root "$ROOT"
python3 "$ROOT/artifact/gate-model/src/independent_recheck.py" --root "$ROOT"
python3 "$ROOT/artifact/src/run_experiments.py" --root "$ROOT"
python3 "$ROOT/artifact/src/independent_recheck.py" --root "$ROOT"
python3 "$ROOT/artifact/commit-replay/src/run_commit_replay.py" --root "$ROOT"
python3 "$ROOT/artifact/commit-replay/src/independent_recheck.py" --root "$ROOT"
python3 "$ROOT/artifact/commit-replay/src/test_publication_protocol.py" --root "$ROOT"
python3 "$ROOT/artifact/upstream-validation/src/run_validation.py" --root "$ROOT"
python3 "$ROOT/artifact/upstream-validation/src/independent_recheck.py" --root "$ROOT"
"$ROOT/paper/compile.sh"
python3 "$ROOT/paper/verify_author_metadata.py" --paper "$ROOT/paper"
python3 "$ROOT/paper/verify_reference_lock.py" --paper "$ROOT/paper"
TSE01_ROOT="$ROOT" TSE01_PROFILE="$PROFILE" python3 "$ROOT/artifact/src/make_release_materials.py"
find "$ROOT" -type d -name __pycache__ -prune -exec rm -rf {} +

if [[ "$PROFILE" == "review" ]]; then
  python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile review --skip-review-manifest
  python3 "$ROOT/artifact/src/build_review_manifest.py" --root "$ROOT"
  python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile review
else
  python3 "$ROOT/artifact/src/verify_release.py" --root "$ROOT" --profile full
fi
