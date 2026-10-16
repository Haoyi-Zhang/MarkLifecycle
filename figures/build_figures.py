"""Direct vector drawings of the declared ancestry and reconstruction relations."""
import argparse
from pathlib import Path
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle, FancyArrowPatch

plt.rcParams.update({'font.family':'STIXGeneral', 'mathtext.fontset':'stix',
                     'font.size':8.5, 'pdf.fonttype':42, 'ps.fonttype':42,
                     'text.usetex':False, 'axes.unicode_minus':False})


class Drawing:
    def __init__(self, width, height):
        self.fig=plt.figure(figsize=(width/2.54,height/2.54))
        self.ax=self.fig.add_axes([0,0,1,1],xlim=(0,width),ylim=(0,height))
        self.ax.set_aspect('equal'); self.ax.axis('off'); self.labels=[]

    def text(self,x,y,text,size=8.5):
        self.labels.append(self.ax.text(x,y,text,ha='center',va='center',
                                       fontsize=size,linespacing=1.12,zorder=3))

    def box(self,x,y,w,h,text,size=8.5):
        self.ax.add_patch(Rectangle((x-w/2,y-h/2),w,h,fill=True,
                                   facecolor='white',edgecolor='black',lw=.65,zorder=2))
        self.text(x,y,text,size)

    def line(self,points,arrow=False,dashed=False):
        x,y=zip(*points)
        self.ax.plot(x,y,color='black',lw=.65,ls='--' if dashed else '-',zorder=1)
        if arrow:
            self.ax.add_patch(FancyArrowPatch(points[-2],points[-1],
                              arrowstyle='-|>',mutation_scale=8,lw=.65,color='black'))

    def save(self,out,name):
        self.fig.canvas.draw(); renderer=self.fig.canvas.get_renderer()
        extent=self.fig.bbox
        for text in self.labels:
            b=text.get_window_extent(renderer)
            if b.x0<extent.x0 or b.x1>extent.x1 or b.y0<extent.y0 or b.y1>extent.y1:
                raise ValueError('Clipped figure label: '+text.get_text())
        self.fig.savefig(out/(name+'.pdf'),metadata={'Creator':'Python Matplotlib',
                         'Producer':None,'CreationDate':None,'ModDate':None})
        plt.close(self.fig)


def ancestry(out):
    d=Drawing(8.9,3.35)
    xs=[.94,3.28,5.62,7.96]
    for index,(x,origin) in enumerate(zip(xs,[28,26,24,22])):
        d.box(x,1.95,1.62,1.02,f'Release {index}\norigin {origin}',8)
    for left,right in zip(xs,xs[1:]):
        d.line([(left+.81,1.95),(right-.81,1.95)],arrow=True)
        d.text((left+right)/2,2.86,'26 of 28',8)
    d.line([(xs[0],1.44),(xs[0],.88),(xs[-1],.88),(xs[-1],1.44)],dashed=True)
    d.text(4.45,.35,'Origin overlap after three edges: 22 of 28',8)
    d.save(out,'ancestry')


def workflow(out):
    d=Drawing(17.5,5.25)
    d.box(1.62,2.6,2.95,1.1,'Named release\nand parent set')
    frame=Rectangle((4.0,.2),9.5,4.8,fill=False,edgecolor='black',lw=.65,ls='--')
    d.ax.add_patch(frame)
    d.text(8.75,4.6,'Independent reconstruction from retained evidence',9)
    for x,text in [(5.62,'Behavior\noutput, exit\nand diagnostics'),
                   (8.75,'Recovery'),(11.88,'Continuity')]:
        d.box(x,3.35,2.68,1.16,text)
    for x,text in [(5.62,'Source profile'),(8.75,'Executable\nreproduction'),
                   (11.88,'Integrity')]:
        d.box(x,1.96,2.68,1.0,text)
    d.box(8.75,.77,2.68,.72,'Lineage')
    d.box(15.88,2.6,2.95,1.1,'Typed outcome\npass, hold, or reject')
    d.line([(3.095,2.6),(4.0,2.6)],arrow=True)
    d.line([(13.5,2.6),(14.405,2.6)],arrow=True)
    d.save(out,'workflow')


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--outdir',type=Path,default=Path(__file__).resolve().parent)
    args=parser.parse_args();args.outdir.mkdir(parents=True,exist_ok=True)
    ancestry(args.outdir);workflow(args.outdir)


if __name__=='__main__':
    main()
