--Iniciar Variables
local fondo=display.newImage"imgs/fondo.png"
local brujita=display.newImage"imgs/brujita.png"
local supermp3=audio.loadSound("super.mp3")
audio.play(supermp3)
--
local datosimagen ={width=100, height=34, numFrames=4, sheetcontentwidth=400, sheetcntentheight=34}
--
puma= graphics.newImageSheet("imgs/super.png",datosimagen)
--
local correr ={
  name="normalRun",
  start=1,
  count=4,
  time=10,
  loopCount=0,
  loopDirection="forward",
}
--
local superA = display.newSprite (puma,correr)
--
superA:play()
--
transition.to(superA,{x=display.contentWidth+300,time=11000})
--
--Posiciones
fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;
brujita.y=40
brujita.x=0

superA.y=80
superA.x=0
--Tamaños
fondo.yScale=1.5
fondo.xScale=1.5
brujita.width=70
brujita.height=70
--acciones 
transition.to(brujita,{x=display.contentWidth+100,y=display.contentHeight+300,time=100000})
transition.to(fondo,{x=display.contentWidth-300,time=10000})