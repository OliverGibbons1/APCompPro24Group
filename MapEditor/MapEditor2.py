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

# Individual Images

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