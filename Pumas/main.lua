local fondo = display.newImage"imgs/box0.png"
--primer paso 
--definir el sprite
local datosimagen ={width=512, height=256, numFrames=8, sheetcontentwidth=1024, sheetcntentheight=1024}
--Segundo paso asignar el sprite a un objeto que se pueda animar 
puma= graphics.newImageSheet("Sprite/puma.png",datosimagen)
--Tercer Paso definir las caracteristicas de la animacion
local correr ={
  name="normalRun",
  start=1,
  count=8,
  time=400,
  loopCount=0,
  loopDirection="forward",
}
--crear sprite
local p1 = display.newSprite (puma,correr)
local p2 = display.newSprite (puma,correr)
local p3 = display.newSprite (puma,correr)
local p4 = display.newSprite (puma,correr)
local p5 = display.newSprite (puma,correr)


--Reproducir la animacion
p1:play()
p2:play()
p3:play()
p4:play()
p5:play()

--Fondo 
p1.y=40;
p1.x=-300;
p1.yScale=.25
p1.xScale=.25

p2.y=100;
p2.x=-300;
p2.yScale=.40
p2.xScale=.40

p3.y=170;
p3.x=-300;
p3.yScale=.40
p3.xScale=.40

p4.y=130;
p4.x=-300;
p4.yScale=.40
p4.xScale=.40

p5.y=250;
p5.x=-300;
p5.yScale=.60
p5.xScale=.60

fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;
fondo.yScale=2.5
fondo.xScale=5

--movimientos 
transition.to(p1,{x=display.contentWidth+300,time=11000})
transition.to(p2,{x=display.contentWidth+300,time=10000})
transition.to(p3,{x=display.contentWidth+300,time=9000})
transition.to(p4,{x=display.contentWidth+300,time=8000})
transition.to(p5,{x=display.contentWidth+300,time=7000})
transition.to(fondo,{x=display.contentWidth-300,time=7000})