import json
import numpy as np
import pygame as pg
from pygame.locals import *
from pygame.transform import scale
from pygame import draw
from math import sin, pi

# Enemy Editor
#  - Save enemy
#  - Load enemy
# Map editor
#  - Save map
#  - Load map
#  - Add tiles
#  - Remove tiles
#  - Add Border
#  - Remove Border
#  - Add enemy
#  - Remove enemy
#  - Event Trigger

# All Individual Images

# MapTilesRef 1D list of Strings Refrencing tile filenames
# MapTiles 2D array of Integers Refrencing MapTilesRef
# ObjectTiles 2D array of Strings Refrencing object
# EventTiles 2D array of Strings Refrencing event
# CollisionTiles 2D Boolean
# Enemy 2D array of Strings Refrencing enemy

class MapTile:
	def __init__(self, x, y, w, h, img):
		self.rect = pg.Rect(x, y, w, h)
		self.img = img
		self.x = x
		self.y = y
	def draw(self, screen):
		screen.blit(self.img, (self.x, self.y))

class ObjectTile:
	def __init__(self, x, y, w, h, img):
		self.rect = pg.Rect(x, y, w, h)
		self.img = img
		self.x = x
		self.y = y
	def draw(self, screen):
		screen.blit(self.img, (self.x, self.y))

class EventTile:
	def __init__(self, x, y, w, h, img):
		self.rect = pg.Rect(x, y, w, h)
		self.img = img
		self.x = x
		self.y = y
	def draw(self, screen):
		screen.blit(self.img, (self.x, self.y))

class CollisionTile:
	def __init__(self, x, y, w, h, img):
		self.rect = pg.Rect(x, y, w, h)
		self.img = img
		self.x = x
		self.y = y
	def draw(self, screen):
		screen.blit(self.img, (self.x, self.y))

class Enemy:
	def __init__(self, x, y, w, h, img):
		self.rect = pg.Rect(x, y, w, h)
		self.img = img
		self.x = x
		self.y = y
	def draw(self, screen):
		screen.blit(self.img, (self.x, self.y))

class MapEditor:
	def __init__(self,screen):
		self.screen = screen
		self.width = 800
		self.height = 600
		self.running = True
		self.tile = pg.image.load('tile.png')
		self.tile = scale(self.tile, (32, 32))
		self.map = []