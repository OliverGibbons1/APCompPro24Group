import pygame as pg
import numpy as np
import math as m

mouse = [0,0,False,False,False,0]
keyboard = []

def keyboard_update():
	global keyboard,mouse
	keyboard=[]
	pgGet=pg.event.get()
	for event in pgGet:
		if event.type==pg.MOUSEWHEEL:
			mouse[5]=event.y
		if event.type==pg.MOUSEBUTTONDOWN:
			try:
				mouse[event.button+1]=True
			except:
				pass
		elif event.type==pg.MOUSEBUTTONUP:
			try:
				mouse[event.button+1]=False
			except:
				pass
		elif event.type==pg.KEYDOWN:
			keyboard.append(event.key)
	if len(keyboard)>0:
		print(keyboard)
	mouse=list(pg.mouse.get_pos())+mouse[2:]
	return pgGet

class Button:
	def __init__(self, text, pos, size, color=(255,255,255), font="Arial", font_size=20, font_color=(0,0,0)):
		self.text = text
		self.pos = pos
		self.size = size
		self.color = color
		self.font = font
		self.font_size = font_size
		self.font_color = font_color
		self.rect = pg.Rect(pos, size)
		self.font = pg.font.SysFont(font, font_size)
		self.text_surface = self.font.render(text, True, font_color)
		self.text_rect = self.text_surface.get_rect(center=self.rect.center)
		self.click_time = 0
	def draw(self, screen):
		pg.draw.rect(screen, self.color, self.rect)
		screen.blit(self.text_surface, self.text_rect)
	def clicked(self, mouse):
		if self.rect.collidepoint(mouse[0], mouse[1]) and mouse[2]:
			self.click_time += 1
			#print(self.click_time)
			return True,self.click_time==1
		else:
			self.click_time = 0
			return False,False

class InputBox:
	def __init__(self, pos, size, color=(255,255,255), font="Arial", font_size=20, font_color=(0,0,0), constraint="normal", auto_correct_terms=[]):
		self.pos = pos
		self.size = size
		self.color = color
		self.font = font
		self.font_size = font_size
		self.font_color = font_color
		self.rect = pg.Rect(pos, size)
		self.font = pg.font.SysFont(font, font_size)
		self.keypressed=[]
		self.txt=""
		self.selected=False
		self.text_surface = self.font.render(self.txt, True, self.font_color)
		self.auto_surface = self.font.render("", True, self.font_color)
		self.text_rect = self.text_surface.get_rect(center=self.rect.center)
		self.auto_rect = self.auto_surface.get_rect(center=self.rect.center)
		self.pointer=0
		self.blinkTimer=0
		self.constraint=constraint
		self.auto_correct_terms=auto_correct_terms
	def draw(self, screen):
		pg.draw.rect(screen, self.color, self.rect)
		self.text_rect = self.text_surface.get_rect(center=self.rect.center)
		s_text=(self.txt[:self.pointer]+(" " if self.blinkTimer>30 or not self.selected else "|")+self.txt[self.pointer:])
		self.text_surface = self.font.render(s_text, True, self.font_color)
		self.blinkTimer+=1
		if self.blinkTimer>60:
			self.blinkTimer=0
		screen.blit(self.text_surface, self.text_rect)
		if False: # Disabled for now
			auto_color=(127,127,127)
			self.auto_rect = self.auto_surface.get_rect(center=self.rect.center)
			self.auto_surface = self.font.render((" "*(int(len(s_text)*2))+"hi"), True, auto_color)
			print(len(s_text))
			screen.blit(self.auto_surface, self.auto_rect)
	def clicked(self, mouse):
		if self.rect.collidepoint(mouse[0], mouse[1]) and mouse[2]:
			self.selected=True
			return True
		elif not self.rect.collidepoint(mouse[0], mouse[1]) and mouse[2]:
			self.selected=False
			return False
		return False
	def keypress(self, keypressed):
		if not self.selected:
			return
		Constraints={"normal":(lambda a: a.isprintable()),"number":(lambda a: a.isprintable()),"decimal":(lambda a: a.isnumeric or a=="."),"email":(lambda a: a.isprintable()),"ip":(lambda a: a.isnumeric() or a==".")}
		shift=keypressed.__contains__(pg.K_LSHIFT)
		pre=len(self.txt)
		self.txt=self.txt+"".join([str(chr(x)).upper() if keypressed[:keypressed.index(x)].__contains__(pg.K_LSHIFT) else str(chr(x)) for x in keypressed if str(chr(min(x,300))).isprintable() if x<300])
		self.txt=self.txt[:self.pointer-keypressed.count(8)]+self.txt[self.pointer:]
		self.txt="".join([x for x in self.txt if Constraints[self.constraint](x)])
		self.pointer+=len(self.txt)-pre
		if keypressed.__contains__(pg.K_LEFT):
			self.blinkTimer=0
			self.pointer-=1
		if keypressed.__contains__(pg.K_RIGHT):
			self.blinkTimer=0
			self.pointer+=1
		self.pointer=max(0,min(self.pointer,len(self.txt)))