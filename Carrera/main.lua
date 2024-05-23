local fondo = display.newImage"imgs/fondo.png"
local trote=audio.loadSound "sounds/trote.mp3"
local clasica=audio.loadSound "sounds/clasica.mp3"
local relin=audio.loadSound "sounds/relinchar.mp3"
audio.play(trote)
audio.play(clasica)
audio.play(relin)
--primer paso 
--definir el sprite
local datosimagen ={width=71, height=49, numFrames=8, sheetcontentwidth=143, sheetcntentheight=199}
--Segundo paso asignar el sprite a un objeto que se pueda animar 
caballo1= graphics.newImageSheet("imgs/1.png",datosimagen)
caballo2= graphics.newImageSheet("imgs/2.png",datosimagen)
caballo3= graphics.newImageSheet("imgs/3.png",datosimagen)
caballo4= graphics.newImageSheet("imgs/4.png",datosimagen)
caballo5= graphics.newImageSheet("imgs/5.png",datosimagen)
--Tercer Paso definir las caracteristicas de la animacion
local correr ={
  name="normalRun",
  start=1,
  count=8,
  time=600,
  loopCount=0,
  loopDirection="forward",
}
--crear sprite
local c1 = display.newSprite (caballo1,correr)
local c2 = display.newSprite (caballo2,correr)
local c3 = display.newSprite (caballo3,correr)
local c4 = display.newSprite (caballo4,correr)
local c5 = display.newSprite (caballo5,correr)


--Reproducir la animacion
c1:play()
c2:play()
c3:play()
c4:play()
c5:play()

--Fondo 
c1.y=60;
c1.x=-300;
c1.yScale=1
c1.xScale=1

c2.y=100;
c2.x=-300;
c2.yScale=1
c2.xScale=1

c3.y=170;
c3.x=-300;
c3.yScale=1
c3.xScale=1

c4.y=130;
c4.x=-300;
c4.yScale=1
c4.xScale=1

c5.y=200;
c5.x=-300;
c5.yScale=1
c5.xScale=1

fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;
fondo.yScale=1
fondo.xScale=1

--movimientos 
transition.to(c1,{x=display.contentWidth+300,time=math.random(10000,15000)})
transition.to(c2,{x=display.contentWidth+300,time=math.random(5000,11000)})
transition.to(c3,{x=display.contentWidth+300,time=math.random(5000,11000)})
transition.to(c4,{x=display.contentWidth+300,time=math.random(5000,11000)})
transition.to(c5,{x=display.contentWidth+300,time=math.random(5000,11000)})
