import json
import numpy as np
import pygame as pg
from pygame.locals import *
from pygame.transform import scale
from pygame import draw
from math import sin, pi

pg.init()
pg.font.init()
SF=2
tileSize=(32,32)
tileAmount=(10,10)
f=open("Map.json","w")
f.close()

f=open("Map.json","r")
c=f.read()
if c=='':
	Map=np.zeros(tileAmount,dtype=int).tolist()
else:
	Map=json.loads(c)["MapTiles"]
f.close()

def SaveMap(Map):
	f=open("Map.json","w")
	json.dump({"MapTilesRef":["CobbleStoneTile.png","GrassTile.png","WaterTile.png","PlanksTile.png"],"MapTiles":Map},f)
	f.close()
print(Map)
SaveMap(Map)

RscreenSize=(tileSize[0]*(tileAmount[0]+1)*SF,tileSize[1]*tileAmount[1]*SF)
screenSize=(tileSize[0]*tileAmount[0]*SF,tileSize[1]*tileAmount[1]*SF)
screen = pg.display.set_mode(RscreenSize)
tScreenSize=(screenSize[0]//(tileSize[0]*SF),(screenSize[1]//(tileSize[1]*SF)))
print(tScreenSize)
pg.display.set_caption("Map Editor")
clock = pg.time.Clock()
Font=pg.font.Font(None, 36)
SaveLogo=Font.render("Saved!",True,(0,0,0))
mouse = [0,0,False,False,False]
keyboard = []
spriteSheet=pg.image.load("Spritesheet.png")
sprites=[]
SSheetSize=spriteSheet.get_size()
for y in range(0,SSheetSize[1],32):
	for x in range(0,SSheetSize[0],32):
		sprites.append(spriteSheet.subsurface((x,y,32,32)))
ScrollOffset=0
SelectedSprite=0
Shift=False
Alt=False
Ctrl=False
SaveLogoTimer=0
PrevMouse=[0,0]
running = True
while running:
	screen.fill((127,127,127))
	keyboard=[]
	for event in pg.event.get():
		try:
			if event.type == pg.QUIT:
				running = False
			elif event.type==pg.KEYDOWN:
				if event.key==pg.K_LSHIFT:
					Shift=True
				if event.key==pg.K_LALT:
					Alt=True
				if event.key==pg.K_LCTRL:
					Ctrl=True
				keyboard.append(event.key)
			elif event.type==pg.KEYUP:
				if event.key==pg.K_LSHIFT:
					Shift=False
				if event.key==pg.K_LALT:
					Alt=False
				if event.key==pg.K_LCTRL:
					Ctrl=False
			elif event.type==pg.MOUSEWHEEL:
				ScrollOffset+=event.y*tileSize[1]*SF*(1 if Shift else 0.25)
				ScrollOffset=min(0,max((len(sprites)*tileSize[1]*SF-tileSize[1]*SF*(tileAmount[1]+1))*-1,ScrollOffset))
			elif event.type==pg.MOUSEBUTTONDOWN:
				mouse[event.button+1]=True
			elif event.type==pg.MOUSEBUTTONUP:
				mouse[event.button+1]=False
		except:
			print(event.button,pg.MOUSEBUTTONUP==event.type,event.button==pg.MOUSEWHEEL)
	if len(keyboard)>0:
		print(keyboard)
	for x in range(tileAmount[0]):
		for y in range(tileAmount[1]):
			draw.rect(screen, (200,200,200) if (x+y)%2==1 else (220,220,220), (x*tileSize[0]*SF,y*tileSize[1]*SF,tileSize[0]*SF,tileSize[1]*SF))
			screen.blit(scale(sprites[Map[y][x]],(tileSize[0]*SF,tileSize[1]*SF)),(x*tileSize[0]*SF,y*tileSize[1]*SF))
	for y in range(len(sprites)):
		screen.blit(scale(sprites[y],(tileSize[0]*SF,tileSize[1]*SF)),(RscreenSize[0]-tileSize[0]*SF,y*tileSize[1]*SF+ScrollOffset))
		if SelectedSprite==y:
			draw.rect(screen, (0,0,0), (RscreenSize[0]-tileSize[0]*SF,y*tileSize[1]*SF+ScrollOffset,tileSize[0]*SF,tileSize[1]*SF),1)
	if mouse[2] and mouse[0]>RscreenSize[0]-tileSize[0]*SF: # Selecting Tile
		SelectedSprite=(mouse[1]-ScrollOffset)//(tileSize[1]*SF)
		if SelectedSprite>=len(sprites):
			SelectedSprite=len(sprites)-1
		elif SelectedSprite<0:
			SelectedSprite=0
		mouse[2]=False
	if Alt: # Display Fill Grid
		cx=mouse[0]//(tileSize[0]*SF)
		cy=mouse[1]//(tileSize[1]*SF)
		px=PrevMouse[0]//(tileSize[0]*SF)
		py=PrevMouse[1]//(tileSize[1]*SF)
		if cx>=0 and cy>=0 and cx<tileAmount[0] and cy<tileAmount[1]:
			for Y in range(min(py,cy),max(py,cy)+1):
				for X in range(min(px,cx),max(px,cx)+1):
					draw.rect(screen, (255 if Y==py else 0,255 if X==cx else 0,0 if X==cx and Y==py else 255), (X*tileSize[0]*SF,Y*tileSize[1]*SF+ScrollOffset,tileSize[0]*SF,tileSize[1]*SF),1)
	if mouse[2] and mouse[0]<RscreenSize[0]-tileSize[0]*SF: # Draw on Map
		x=mouse[0]//(tileSize[0]*SF)
		y=mouse[1]//(tileSize[1]*SF)
		#print(x,y)
		Map[y][x]=SelectedSprite
		if Alt:
			px=PrevMouse[0]//(tileSize[0]*SF)
			py=PrevMouse[1]//(tileSize[1]*SF)
			print("filled in from",(px,py),"to",(x,y))
			for Y in range(min(py,y),max(py,y)+1):
				for X in range(min(px,x),max(px,x)+1):
					Map[Y][X]=SelectedSprite
		PrevMouse=mouse[:2]
		if not Shift:
			mouse[2]=False
	if mouse[3] and mouse[0]<RscreenSize[0]-tileSize[0]*SF: # Pick Tile
		x=mouse[0]//(tileSize[0]*SF)
		y=mouse[1]//(tileSize[1]*SF)
		#print(x,y)
		SelectedSprite=Map[y][x]
		mouse[3]=False
	if Ctrl and keyboard.count(pg.K_s)>0:
		SaveLogoTimer=60
		SaveMap(Map)
	if SaveLogoTimer>0:
		screen.blit(SaveLogo,(screenSize[0]-SaveLogo.get_width(),screenSize[1]-min(sin(SaveLogoTimer/(pi*6))*SaveLogo.get_height()*2,SaveLogo.get_height())))
		SaveLogoTimer-=1
	mouse=list(pg.mouse.get_pos())+mouse[2:]
	pg.display.flip()
	clock.tick(60)
pg.quit()