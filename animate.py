import matplotlib
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from PIL import Image
import sys

f = open(sys.argv[1] + ".stack", "r")
offl = (sys.argv[1]).split('/')
off = ""
for i in range(0,len(offl)-1):
	off="/"+offl[i]
off = off[1:]
l = f.readlines()
x = [s.strip() for s in l[1:-1]]
print(x)
# x = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg","12.jpg"]
fig = plt.figure()

# # Writer = animation.writers['ffmpeg']
# # writer = Writer(fps=6, metadata=dict(artist='Me'), bitrate=1800)

plt.tight_layout()
index = 0
curr = -1
time = -1
def animate(i):
	global index
	global curr
	global time
	time = time + 1
	if(time>=curr and index < len(x)):
		plt.clf()
		plt.axis('off')
		di = (x[index]).split(' ')
		n = int((len(di)-2)/4)
		curr = int(di[1])
		index = index+1
		for k in range(0,n):
			y = Image.open(off + "/"+di[4*k+2])
			y = y.resize((400,200),Image.ANTIALIAS)
			y = y.rotate(int(di[4*k+5]),expand = True, fillcolor='white')
			fig.figimage(y, int(di[4*k+3]), int(di[4*k+4]))

ani = animation.FuncAnimation(fig, animate, frames = 36,interval=30,repeat=False) 
ani.save((sys.argv[2]+".gif"), writer='imagemagick', fps=6)
plt.show()