import json
import numpy as np
import pygame as pg
from pygame.locals import *
from pygame.transform import scale

pg.init()
pg.font.init()
SF=5
tileSize=(32,32)
tileAmount=(10,10)
screenSize=(tileSize[0]*tileAmount[0]*SF,tileSize[1]*tileAmount[1]*SF)
screen = pg.display.set_mode(screenSize)
tScreenSize=(screenSize[0]//(tileSize[0]*SF),(screenSize[1]//(tileSize[1]*SF)))
print(tScreenSize)
pg.display.set_caption("Map Editor")
clock = pg.time.Clock()
mouse = [0,0,False,False,False]
keyboard = []
spriteSheet=pg.image.load("Spritesheet.png")
sprites=[]
SSheetSize=spriteSheet.get_size()
for y in range(0,SSheetSize[1],32):
	for x in range(0,SSheetSize[0],32):
		sprites.append(spriteSheet.subsurface((x,y,32,32)))
running = True
while running:
	screen.fill((127,127,127))
	keyboard=[]
	for event in pg.event.get():
		try:
			if event.type == pg.QUIT:
				running = False
			elif event.type==pg.MOUSEBUTTONDOWN:
				mouse[event.button+1]=True
			elif event.type==pg.MOUSEBUTTONUP:
				mouse[event.button+1]=False
			elif event.type==pg.KEYDOWN:
				keyboard.append(event.key)
		except:
			pass
	if len(keyboard)>0:
		print(keyboard)
	mouse=list(pg.mouse.get_pos())+mouse[2:]
	pg.display.flip()
	clock.tick(60)
pg.quit()