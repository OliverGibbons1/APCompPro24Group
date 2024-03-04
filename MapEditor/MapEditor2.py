import os
from os import getcwd as gcd
import json
import numpy as np
import pygame as pg
from pygame.locals import *
from pygame.transform import scale
from pygame import draw
from math import sin, pi
import sys
from BetterPyGame import Button, InputBox
import BetterPyGame as BPG

def OSPath(x):
    if sys.platform=="win32":
        return x.replace("/", "\\")
    else:
        return x
pf=gcd().replace("\\", "/")
print(pf)
pf="/".join(pf.split("/")[:-1])
src=pf+"/src"
SpritesFolder=src+"/Sprites"
MapTilesFolder=SpritesFolder+"/MapTiles"
MapBackFolder=MapTilesFolder+"/MapBack"
MapForeFolder=MapTilesFolder+"/MapFore"
NPCSpritesFolder=SpritesFolder+"/NPCSprites"
print(pf)
if not os.path.exists(src):
    exit(128)


# Simple Methods

def rl(x):
    return range(len(x))

# --------------

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

# Background MapTiles
# NPC Layer
# Foreground Objects


class MapBack:
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
    def __init__(self,screen,ProgSize,SpriteSize):
        self.spriteCount=(10,10)
        self.spriteSize=SpriteSize
        self.screen = screen
        self.width = ProgSize[0]
        self.height = ProgSize[1]
        self.running = True
        self.Selected = (0,0) # (0 Background, 1 NPC, 2 Foreground, 3 Event),(index)

        f=open("EventObjects.json","r")
        self.EventJSON=json.loads(f.read())
        f.close()

        self.BackRef = [pg.image.load(OSPath(f"{MapBackFolder}/{x.decode()}")) for x in os.listdir(os.fsencode(OSPath(MapBackFolder))) if x.decode().endswith(".png")]
        self.MapBackTiles = np.zeros(self.spriteCount,dtype=int)
        print(os.fsencode(OSPath(MapBackFolder)))
        self.NPCRef = [pg.image.load(OSPath(f"{NPCSpritesFolder}/{x.decode()}")) for x in os.listdir(os.fsencode(OSPath(NPCSpritesFolder))) if x.decode().endswith(".png")]
        self.MapNPCTiles = np.zeros(self.spriteCount,dtype=int)

        self.ForeRef = [pg.image.load(OSPath(f"{MapForeFolder}/{x.decode()}")) for x in os.listdir(os.fsencode(OSPath(MapForeFolder))) if x.decode().endswith(".png")]
        self.MapForeTiles = np.zeros(self.spriteCount,dtype=int)

        self.EventRef = [x[0:2] for x in self.EventJSON]
        print(self.EventRef)
        self.MapEventTiles = [[{} for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]
        #print(self.MapEventTiles)
        #             Back,NPC,Fore
        self.map = [[[0,   0,  0] for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]
    def draw(self):
        # Draw Background Grid
        for y in range(self.spriteCount[1]):
            for x in range(self.spriteCount[0]):
                draw.rect(self.screen,(120,120,120) if (x+y)%2==1 else (0,0,0),(x*self.spriteSize[0],y*self.spriteSize[1],self.spriteSize[0],self.spriteSize[1]))
        # Draw MapTiles / Background Layer
        for y in range(self.MapBackTiles.shape[0]):
            for x in range(self.MapBackTiles.shape[1]):
                self.screen.blit(scale(self.BackRef[self.MapBackTiles[y][x]],self.spriteSize),(x*self.spriteSize[0],y*self.spriteSize[1]))
        # Mouse Selection
        m=BPG.mouse
        if m[2] and m[0]>self.width-self.spriteSize[0]//2*4 and m[1]<self.spriteSize[1]*4*self.spriteCount[1]:
            self.Selected=(max(0,3-((self.spriteCount[0]*2+3)-m[0]//(self.spriteSize[1]//2))),m[1]//(self.spriteSize[1]//2))
        self.Selected=(self.Selected[0],min(self.Selected[1],len(self.BackRef)-1) if self.Selected[0]==0 else min(self.Selected[1],len(self.NPCRef)-1) if self.Selected[0]==1 else min(self.Selected[1],len(self.ForeRef)-1) if self.Selected[0]==2 else min(self.Selected[1],len(self.EventRef)-1))
        #print(self.Selected)
        # Draw BackRef
        for BRef in rl(self.BackRef):
            self.screen.blit(scale(self.BackRef[BRef],(self.spriteSize[0]//2,self.spriteSize[1]//2)),(self.width-self.spriteSize[0]//2*4,BRef*self.spriteSize[1]//2))
        # Draw NPCRef
        for NRef in rl(self.NPCRef):
            self.screen.blit(scale(self.NPCRef[NRef],(self.spriteSize[0]//2,self.spriteSize[1]//2)),(self.width-self.spriteSize[0]//2*3,NRef*self.spriteSize[1]//2))
        # Draw ForeRef
        for FRef in rl(self.ForeRef):
            self.screen.blit(scale(self.ForeRef[FRef],(self.spriteSize[0]//2,self.spriteSize[1]//2)),(self.width-self.spriteSize[0]//2*2,FRef*self.spriteSize[1]//2))
        # Draw EventRef
        for ERef in rl(self.EventRef):
            txt=Font.render(self.EventRef[ERef],True,(0,0,0))
            self.screen.blit(txt,(self.width-self.spriteSize[0]//2*1,ERef*self.spriteSize[1]//2))
        draw.rect(self.screen,(0,0,0),((self.width-self.spriteSize[0]//2*(4-self.Selected[0]),self.Selected[1]*self.spriteSize[1]//2),(self.spriteSize[0]//2,self.spriteSize[1]//2)),2)
pg.init()
pg.font.init()

screen = pg.display.set_mode((64*10 + 32*4, 64*10 + 64*2 ))
pg.display.set_caption("Map Editor")
clock = pg.time.Clock()
Font=pg.font.Font(None, 36)
screenSize=pg.display.get_surface().get_size()
ME=MapEditor(screen, screenSize, (64,64))

running=True
while running:
    screen.fill((100,100,100))
    PGE=BPG.keyboard_update()
    #print(BPG.mouse)
    for event in PGE:
        if event.type == QUIT:
            print("Quitting")
            running = False
        if event.type == KEYDOWN:
            if event.key == K_ESCAPE:
                running = False
    ME.draw()
    pg.display.flip()
    clock.tick(60)
pg.quit()
