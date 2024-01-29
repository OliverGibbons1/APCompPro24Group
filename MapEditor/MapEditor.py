import json
import numpy as np
import pygame as pg
from pygame.locals import *

pg.init()
pg.font.init()

screen = pg.display.set_mode((320*2,320*2))
pg.display.set_caption("Map Editor")
clock = pg.time.Clock()
mouse = [0,0,False,False,False]
keyboard = []
while True:
	screen.fill((0,0,0))
	keyboard=[]
	for event in pg.event.get():
		if event.type == pg.QUIT:
			running = False
		elif event.type==pg.MOUSEBUTTONDOWN:
			mouse[event.button+1]=True
		elif event.type==pg.MOUSEBUTTONUP:
			mouse[event.button+1]=False
		elif event.type==pg.KEYDOWN:
			keyboard.append(event.key)
	if len(keyboard)>0:
		print(keyboard)
	pg.display.flip()
	clock.tick(60)