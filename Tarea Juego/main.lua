--0. cargar librerias
fisica =require("physics"); fisica.start()
--1. cargar imagenes, videos, sonidos
local background = display.newImage"imgs/fondo.jpg"
local suelo = display.newImage"imgs/plataforma.jpg"
local tapa = display.newImage"imgs/plataforma.jpg"
local li=display.newImage"imgs/fondo.jpg"
local ld=display.newImage"imgs/fondo.jpg"
local objetos=display.newImage"imgs/objetos.png"
local o1=display.newImage"imgs/objetos.png"
local o2=display.newImage"imgs/objetos.png"
local o3=display.newImage"imgs/objetos.png"
local o4=display.newImage"imgs/objetos.png"
local o5=display.newImage"imgs/objetos.png"
local o6=display.newImage"imgs/objetos.png"
local o7=display.newImage"imgs/objetos.png"
local o8=display.newImage"imgs/objetos.png"
local o9=display.newImage"imgs/objetos.png"
local o10=display.newImage"imgs/objetos.png"
local o11=display.newImage"imgs/objetos.png"
local o12=display.newImage"imgs/objetos.png"
local caja=display.newImage"imgs/caja.png"
local caja1=display.newImage"imgs/caja.png"
local caja2=display.newImage"imgs/caja.png"
local caja3=display.newImage"imgs/caja.png"
local caja4=display.newImage"imgs/caja.png"
local caja5=display.newImage"imgs/caja.png"
local button=display.newImage"imgs/button.png"
local restart=display.newImage"imgs/restart.png"
local punto1=display.newImage"imgs/1.png"
local punto2=display.newImage"imgs/2.png"
local punto3=display.newImage"imgs/3.png"
local punto4=display.newImage"imgs/4.png"
local punto1d=display.newImage"imgs/1.png"
local punto2d=display.newImage"imgs/2.png"
local punto3d=display.newImage"imgs/3.png"
  local escoba = display.newImage"imgs/escoba.png"
-- ajustar imagenes, videos, sonidos
li.width=2
li.height=display.contentHeight*3
li.x=0
li.y=-50
ld.width=2
ld.height=display.contentHeight*3
ld.x=display.contentWidth
ld.y=-54
--suelo
suelo.x=display.contentCenterX; suelo.height=50; suelo.width=383; suelo.y=display.contentHeight+87;
tapa.x=display.contentCenterX; tapa.height=20; tapa.width=383; tapa.y=display.contentHeight-585;
--objetos
objetos.x=40
objetos.y=-20
o1.x=80
o1.y=30
o2.x=120
o2.y=130
o3.x=160
o3.y=240
o4.x=200
o4.y=330
o5.x=270
o5.y=5
o6.x=230
o6.y=105
o7.x=250
o7.y=205
o8.x=50
o8.y=305
o9.x=100
o9.y=360
o10.x=50
o10.y=205
o11.x=250
o11.y=380
o12.x=200
o12.y=-40
--Cajas del final
punto1.x=15;punto1.y=450; punto1.height=40; punto1.width=50;
caja.x=40
caja.y=500
punto2.x=65;punto2.y=450; punto2.height=40; punto2.width=50;
caja1.x=90
caja1.y=500
punto3.x=115;punto3.y=450; punto3.height=40; punto3.width=50;
caja2.x=140
caja2.y=500
punto4.x=165;punto4.y=450; punto4.height=40; punto4.width=50;
caja3.x=190
caja3.y=500
punto3d.x=210;punto3d.y=450; punto3d.height=40; punto3d.width=50;
caja4.x=235
caja4.y=500
punto2d.x=255;punto2d.y=450; punto2d.height=40; punto2d.width=50;
caja5.x=280
caja5.y=500
punto1d.x=305;punto1d.y=450; punto1d.height=40; punto1d.width=50;
--button
button.x=display.contentCenterX; button.height=80; button.width=100; button.y=display.contentHeight+87;
restart.x=270; restart.height=40; restart.width=50; restart.y=display.contentHeight+87;
escoba.x=40; escoba.height=40; escoba.width=50; escoba.y=display.contentHeight+87;
--funciones
local function crear()
  local asteroid = display.newImage"imgs/punto.png"
  local aleatorio = math.random(9,15)
    local aleatoriop = math.random(-20,500)
  asteroid.width=aleatorio
    asteroid.height=aleatorio
    asteroid.x=aleatoriop
    asteroid.y=-80
  fisica.addBody(asteroid,'dinamic',{ desity=1.0, friction=1000, bounce=1.0 })
end
--eventos
 button:addEventListener("touch",crear)
 
 local function mover(event)
  escoba.x=event.x
   escoba.y=event.y
end
--eventos
escoba:addEventListener("touch",mover)
--fisicas
fisica.addBody(caja,'static')
fisica.addBody(caja1,'static')
fisica.addBody(caja2,'static')
fisica.addBody(caja3,'static')
fisica.addBody(caja4,'static')
fisica.addBody(caja5,'static')
fisica.addBody(objetos,'static',{friction})
fisica.addBody(o1,'static',{friction})
fisica.addBody(o2,'static',{friction})
fisica.addBody(o3,'static',{friction})
fisica.addBody(o4,'static',{friction})
fisica.addBody(o5,'static',{friction})
fisica.addBody(o6,'static',{friction})
fisica.addBody(o7,'static',{friction})
fisica.addBody(o8,'static',{friction})
fisica.addBody(o9,'static',{friction})
fisica.addBody(o10,'static',{friction})
fisica.addBody(o11,'static',{friction})
fisica.addBody(o12,'static',{friction})
fisica.addBody(suelo,'static',{friction})
fisica.addBody(tapa,'static',{friction})
fisica.addBody(li,'static')
fisica.addBody(ld,'static')
fisica.addBody(escoba,'static')