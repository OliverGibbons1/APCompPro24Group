import os
from os import getcwd as gcd
import json
import numpy as np
import pygame as pg
from pygame.locals import *
from pygame.transform import scale
from pygame import draw
from math import sin, pi
from BetterPyGame import Button, InputBox
import BetterPyGame as BPG

pf=gcd()
print(pf)
pf="/".join(pf.split("/")[:-1])
src=pf+"/src"
SpritesFolder=src+"/Sprites"
MapTilesFolder=SpritesFolder+"/MapTiles"
MapBackFolder=MapTilesFolder+"/MapBack"
MapForeFolder=MapTilesFolder+"/MapFore"
NPCSpritesFolder=SpritesFolder+"/NPCSprites"
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
        self.Mouse=(BPG.mouse)
        print(self.Mouse)
        self.HeldKeys=[]
        self.EditorSprites={}
        for x in os.listdir(os.fsencode(f"EditorSprites/")):
            print(x.decode().strip())
            if x.decode().endswith(".png"):
                self.EditorSprites[x.decode().strip().replace(".png", "")]=pg.image.load(f"EditorSprites/{x.decode().strip()}")
        print(self.EditorSprites)
        f=open("EventObjects.json","r")
        self.EventJSON=json.loads(f.read())
        f.close()

        self.InputBoxes=[]

        self.BackRef = [pg.image.load(f"{MapBackFolder}/{x.decode()}") for x in os.listdir(os.fsencode(MapBackFolder)) if x.decode().endswith(".png")]
        self.MapBackTiles = np.zeros(self.spriteCount,dtype=int)
        self.MapBackTiles[0][0]=0

        self.NPCRef = [pg.image.load(f"{NPCSpritesFolder}/{x.decode()}") for x in os.listdir(os.fsencode(NPCSpritesFolder)) if x.decode().endswith(".png")]
        self.MapNPCTiles = np.zeros(self.spriteCount,dtype=int)
        self.MapNPCTiles[:,:]=-1

        self.ForeRef = [pg.image.load(f"{MapForeFolder}/{x.decode()}") for x in os.listdir(os.fsencode(MapForeFolder)) if x.decode().endswith(".png")]
        self.MapForeTiles = np.zeros(self.spriteCount,dtype=int)
        self.MapForeTiles[:,:]=-1

        self.EventRefT = [x[0:2] if len(x.split(" "))<=1 else x.split(" ")[0][0]+x.split(" ")[-1][0] for x in self.EventJSON]
        self.EventRef = [x for x in self.EventJSON]
        self.DataRef = [self.EventJSON[x] for x in self.EventJSON]

        self.BoundaryFirst = (False,False)
        self.Boundary = [[False for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]

        print(self.EventRef,"--")
        self.MapEventTiles = [["" for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]
        self.EventDictTiles = [[{"type":"","data":{}} for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]
        #print(self.MapEventTiles)
        #             Back,NPC,Fore
        self.map = [[[0,   0,  0] for x in range(self.spriteCount[0])] for y in range(self.spriteCount[1])]
    def key_update(self,P):
        for event in P:
            if event.type==pg.KEYDOWN:
                self.HeldKeys.append(event.key)
            if event.type==pg.KEYUP:
                try:
                    self.HeldKeys.remove(event.key)
                except:
                    pass
    def Save(self):
        f=open("Map.json","w")
        json.dump({"MapBackTiles":self.MapBackTiles.tolist(),"MapNPCTiles":self.MapNPCTiles.tolist(),"MapForeTiles":self.MapForeTiles.tolist(),"MapEventTiles":self.EventDictTiles,"Boundary":self.Boundary},f)
        f.close()
        return
    def Load(self):
        f=open("Map.json","r")
        c=f.read()
        f.close()
        if c=='':
            return
        j=json.loads(c)
        BackRef=[pg.image.load(f"{MapBackFolder}/{x.decode()}") for x in os.listdir(os.fsencode(MapBackFolder)) if x.decode().endswith(".png")]
        
        return
    def draw(self):
        # Draw Background Grid
        for y in range(self.spriteCount[1]):
            for x in range(self.spriteCount[0]):
                draw.rect(self.screen,(120,120,120) if (x+y)%2==1 else (0,0,0),(x*self.spriteSize[0],y*self.spriteSize[1],self.spriteSize[0],self.spriteSize[1]))
        # Draw MapTiles / Background Layer
        if len(self.BackRef)>0:
            for y in range(self.MapBackTiles.shape[0]):
                for x in range(self.MapBackTiles.shape[1]):
                    self.screen.blit(scale(self.BackRef[self.MapBackTiles[y][x]],self.spriteSize),(x*self.spriteSize[0],y*self.spriteSize[1]))
        # Draw NPCTiles / NPC Layer
        # print(self.NPCRef)
        if len(self.NPCRef)>0:
            for y in range(self.MapNPCTiles.shape[0]):
                for x in range(self.MapNPCTiles.shape[1]):
                    if self.MapNPCTiles[y][x]>=0:
                        self.screen.blit(scale(self.NPCRef[self.MapNPCTiles[y][x]],self.spriteSize),(x*self.spriteSize[0],y*self.spriteSize[1]))
        # Draw ForegroundTiles / Foreground Layer
        if len(self.ForeRef)>0:
            for y in range(self.MapForeTiles.shape[0]):
                for x in range(self.MapForeTiles.shape[1]):
                    if self.MapForeTiles[y][x]>=0:
                        self.screen.blit(scale(self.ForeRef[self.MapForeTiles[y][x]],self.spriteSize),(x*self.spriteSize[0],y*self.spriteSize[1]))
        # Draw EventTiles / Event Layer
        if len(self.EventRef)>0:
            for y in rl(self.MapEventTiles):
                for x in rl(self.MapEventTiles[y]):
                    if len(self.MapEventTiles[y][x])>0:
                        txt=Font.render(self.EventRefT[self.EventRef.index(self.MapEventTiles[y][x])],True,(0,0,0))
                        self.screen.blit(txt,(x*self.spriteSize[0],y*self.spriteSize[1]))
        # Draw Boundary
        for y in rl(self.Boundary):
            for x in rl(self.Boundary[y]):
                if self.Boundary[y][x]:
                    draw.rect(self.screen,(255,0,0),(x*self.spriteSize[0],y*self.spriteSize[1],self.spriteSize[0],self.spriteSize[1]),2)
        
        
        # Mouse Selection
        m=BPG.mouse
        if m[2] and not self.Mouse[2] and m[0]>self.width-self.spriteSize[0]//2*4 and m[1]<self.spriteSize[1]*4*self.spriteCount[1]:
            self.Selected=(max(0,3-((self.spriteCount[0]*2+3)-m[0]//(self.spriteSize[1]//2))),m[1]//(self.spriteSize[1]//2))
        self.Selected=(self.Selected[0],min(self.Selected[1],len(self.BackRef)-1) if self.Selected[0]==0 else min(self.Selected[1],len(self.NPCRef)-1) if self.Selected[0]==1 else min(self.Selected[1],len(self.ForeRef)-1) if self.Selected[0]==2 else min(self.Selected[1],len(self.EventRef)-1))
        if m[3] and m[0]<self.spriteSize[0]*self.spriteCount[0] and m[1]<self.spriteSize[1]*self.spriteCount[1]:
            if self.BoundaryFirst[0]==False:
                self.BoundaryFirst=(True,self.Boundary[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]])
            self.Boundary[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]=not self.BoundaryFirst[1]
        else:
            self.BoundaryFirst=(False,False)
        if m[2] and not self.Mouse[2] and self.Selected[0]==3:
            self.InputBoxes=[InputBox((20,self.height-x*10),(self.width*3/4,10)) for x in range(len(self.DataRef[self.Selected[1]]))]
        #print(self.HeldKeys)
        #print(self.Mouse,m)
        if self.HeldKeys.__contains__(int(pg.K_LSHIFT)) and self.Selected[0]>0:
            self.Selected=(self.Selected[0],-1)
        # Draw Selected Tile
        if ((m[2] and not self.Mouse[2]) or m[4]) and m[0]<self.spriteSize[0]*self.spriteCount[0] and m[1]<self.spriteSize[1]*self.spriteCount[1]:
            match self.Selected[0]:
                case 0:
                    self.MapBackTiles[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]=self.Selected[1]
                case 1:
                    self.MapNPCTiles[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]=self.Selected[1]
                case 2:
                    self.MapForeTiles[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]=self.Selected[1]
                case 3:
                    self.MapEventTiles[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]="" if self.Selected[1]==-1 else self.EventRef[self.Selected[1]]
                    self.EventDictTiles[m[1]//self.spriteSize[1]][m[0]//self.spriteSize[0]]={"type":("" if self.Selected[1]==-1 else self.EventRef[self.Selected[1]]),"data":self.DataRef[self.Selected[1]]}
        # Draw Bottom Toolbar
        #   Draw Save Button
        tb=m[2] and m[0]>self.width-self.spriteSize[0]*2 and m[0]<self.width-self.spriteSize[0] and m[1]>self.height-self.spriteSize[1]*2 and m[1]<self.height-self.spriteSize[1]
        self.screen.blit(scale(self.EditorSprites["SaveIcon"],((self.spriteSize[0]-4,self.spriteSize[1]-4) if tb else self.spriteSize)),(self.width-self.spriteSize[0]*2+(2 if tb else 0),self.height-self.spriteSize[1]*2+(2 if tb else 0)))
        if tb and not self.Mouse[2]:
            self.Save()
            print("Saved")
        #   Draw Load Button
        ta=m[2] and m[0]>self.width-self.spriteSize[0] and m[1]>self.height-self.spriteSize[1]*2 and m[1]<self.height-self.spriteSize[1]
        self.screen.blit(scale(self.EditorSprites["LoadIcon"],((self.spriteSize[0]-4,self.spriteSize[1]-4) if ta else self.spriteSize)),(self.width-self.spriteSize[0]+(2 if ta else 0),self.height-self.spriteSize[1]*2+(2 if ta else 0)))
        if ta and not self.Mouse[2]:
            print("Load")
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
            txt=Font.render(self.EventRefT[ERef],True,(0,0,0))
            self.screen.blit(txt,(self.width-self.spriteSize[0]//2*1,ERef*self.spriteSize[1]//2))

        # Draw TextBoxes
        for IB in rl(self.InputBoxes):
            self.InputBoxes[IB].draw(self.screen)
            try:
                self.DataRef[self.Selected[1]]=self.InputBoxes[IB].txt if type(self.DataRef)==str else int(self.InputBoxes[IB].txt)
            except:
                pass

        # Mouse Update
        self.Mouse=tuple(m)
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
    ME.key_update(PGE)
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
