local fondo = display.newImage"imgs/fondo.png"
--importar fisicas
fisica =require("physics"); 
fisica.start()
--primer paso 
--definir el sprite
local datosimagen = {width=32, height=48, numFrames=16, sheetcontentWidth=128, sheetcontentHeight=160}
--Segundo paso asignar el sprite a un objeto que se pueda animar 
pers= graphics.newImageSheet("sprit/girl.png",datosimagen)
--Imagenes
local up = display.newImage"imgs/arriba.png"
local down = display.newImage"imgs/abajo.png"
local left = display.newImage"imgs/izquierda.png"
local right = display.newImage"imgs/derecha.png" 
--crear dos variables que controlen las cordenadas de los personajes 
--posicion inicial es en el centro de la pantalla
local posX=display.contentCenterX
local posY=display.contentCenterY

--Rectangulos
local pared1=display.newRect(-200,0,2000,10)
local pared2=display.newRect(-200,320,2000,10)
local pared3=display.newRect(-115,200,10,2000)
local pared4=display.newRect(595,200,10,2000)

local c=display.newRect(200,50,500,20)
local c6=display.newRect(200,150,500,20)

local c1=display.newRect(150,200,20,170)

local c2=display.newRect(250,300,20,170)

local c3=display.newRect(350,200,20,170)
local c4=display.newRect(450,300,20,170)

local c8=display.newRect(450,10,20,170)

local c5=display.newRect(550,200,20,170)

local c7=display.newRect(0,250,20,200)

-----------------------
fisica.addBody(c,"kinematic")
fisica.addBody(c1,"kinematic")
fisica.addBody(c2,"kinematic")
fisica.addBody(c3,"kinematic")
fisica.addBody(c4,"kinematic")
fisica.addBody(c5,"kinematic")
fisica.addBody(c6,"kinematic")
fisica.addBody(c7,"kinematic")
fisica.addBody(c8,"kinematic")

--Tercer Paso definir las caracteristicas de la animacion
local CAbajo ={
  name="normalRun",
  start=1,
  count=4,
  time=500,
  loopCount=0,
  loopDirection="forward",
}
local CIzquierda ={
  name="normalRun",
  start=5,
  count=4,
  time=500,
  loopCount=0,
  loopDirection="forward",
}
local CDerecha ={
  name="normalRun",
  start=9,
  count=4,
  time=500,
  loopCount=0,
  loopDirection="forward",
}
local Cfrente ={
  name="normalRun",
  start=13,
  count=4,
  time=500,
  loopCount=0,
  loopDirection="forward",
}
--crear sprite
 
 local personaje_frente = display.newSprite (pers,CAbajo);
 personaje_frente.x=posX
  personaje_frente.y=posY
  personaje_frente.isVisible=false
  
  
   local personaje_espalda = display.newSprite (pers,Cfrente);
 personaje_espalda.x=posX
  personaje_espalda.y=posY
  personaje_espalda.isVisible=false
  
  
   local personaje_izquierda = display.newSprite (pers,CIzquierda);
 personaje_izquierda.x=posX
  personaje_izquierda.y=posY
  personaje_izquierda.isVisible=false
  
 
   local personaje_derecha = display.newSprite (pers,CDerecha);
 personaje_derecha.x=display.posX
 personaje_derecha.y=display.posY
  personaje_derecha.isVisible=false
  


--Crear las funciones para cada caminar
local function upp(e)
  --frente
personaje_frente.isVisible=false
personaje_espalda.isVisible=true
personaje_izquierda.isVisible=false
personaje_derecha.isVisible=false
personaje_espalda:play()
posY=posY-5
personaje_derecha.y=posY
personaje_izquierda.y=posY
personaje_frente.y=posY
personaje_espalda.y=posY

c:setFillColor(math.random(),math.random(),math.random())
c1:setFillColor(math.random(),math.random(),math.random())
c2:setFillColor(math.random(),math.random(),math.random())
c3:setFillColor(math.random(),math.random(),math.random())
c4:setFillColor(math.random(),math.random(),math.random())
c5:setFillColor(math.random(),math.random(),math.random())
c6:setFillColor(math.random(),math.random(),math.random())
c7:setFillColor(math.random(),math.random(),math.random())
c8:setFillColor(math.random(),math.random(),math.random())
pared1:setFillColor(math.random(),math.random(),math.random())
pared2:setFillColor(math.random(),math.random(),math.random())
pared3:setFillColor(math.random(),math.random(),math.random())
pared4:setFillColor(math.random(),math.random(),math.random())
end

local function dw(e)
  --frente
personaje_frente.isVisible=true
personaje_espalda.isVisible=false
personaje_izquierda.isVisible=false
personaje_derecha.isVisible=false
personaje_frente:play()
posY=posY+5
personaje_derecha.y=posY
personaje_izquierda.y=posY
personaje_frente.y=posY
personaje_espalda.y=posY

c:setFillColor(math.random(),math.random(),math.random())
c1:setFillColor(math.random(),math.random(),math.random())
c2:setFillColor(math.random(),math.random(),math.random())
c3:setFillColor(math.random(),math.random(),math.random())
c4:setFillColor(math.random(),math.random(),math.random())
c5:setFillColor(math.random(),math.random(),math.random())
c6:setFillColor(math.random(),math.random(),math.random())
c7:setFillColor(math.random(),math.random(),math.random())
c8:setFillColor(math.random(),math.random(),math.random())
pared1:setFillColor(math.random(),math.random(),math.random())
pared2:setFillColor(math.random(),math.random(),math.random())
pared3:setFillColor(math.random(),math.random(),math.random())
pared4:setFillColor(math.random(),math.random(),math.random())
end

local function lf(e)
  --frente
personaje_frente.isVisible=false
personaje_espalda.isVisible=false
personaje_izquierda.isVisible=true
personaje_derecha.isVisible=false
personaje_izquierda:play()
posX=posX-5
personaje_derecha.x=posX
personaje_izquierda.x=posX
personaje_frente.x=posX
personaje_espalda.x=posX

c:setFillColor(math.random(),math.random(),math.random())
c1:setFillColor(math.random(),math.random(),math.random())
c2:setFillColor(math.random(),math.random(),math.random())
c3:setFillColor(math.random(),math.random(),math.random())
c4:setFillColor(math.random(),math.random(),math.random())
c5:setFillColor(math.random(),math.random(),math.random())
c6:setFillColor(math.random(),math.random(),math.random())
c7:setFillColor(math.random(),math.random(),math.random())
c8:setFillColor(math.random(),math.random(),math.random())
pared1:setFillColor(math.random(),math.random(),math.random())
pared2:setFillColor(math.random(),math.random(),math.random())
pared3:setFillColor(math.random(),math.random(),math.random())
pared4:setFillColor(math.random(),math.random(),math.random())
end

local function rg(e)
  --frente
personaje_frente.isVisible=false
personaje_espalda.isVisible=false
personaje_izquierda.isVisible=false
personaje_derecha.isVisible=true
personaje_derecha:play()
posX=posX+5
personaje_derecha.x=posX
personaje_izquierda.x=posX
personaje_frente.x=posX
personaje_espalda.x=posX

c:setFillColor(math.random(),math.random(),math.random())
c1:setFillColor(math.random(),math.random(),math.random())
c2:setFillColor(math.random(),math.random(),math.random())
c3:setFillColor(math.random(),math.random(),math.random())
c4:setFillColor(math.random(),math.random(),math.random())
c5:setFillColor(math.random(),math.random(),math.random())
c6:setFillColor(math.random(),math.random(),math.random())
c7:setFillColor(math.random(),math.random(),math.random())
c8:setFillColor(math.random(),math.random(),math.random())
pared1:setFillColor(math.random(),math.random(),math.random())
pared2:setFillColor(math.random(),math.random(),math.random())
pared3:setFillColor(math.random(),math.random(),math.random())
pared4:setFillColor(math.random(),math.random(),math.random())
  end

--Fondo 
up.y=210;
up.x=30;
up.yScale=1
up.xScale=1

down.y=280;
down.x=30;
down.yScale=1
down.xScale=1


left.y=280;
left.x=-40;
left.yScale=1
left.xScale=1

right.y=280;
right.x=100;
right.yScale=1
right.xScale=1

fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;
fondo.yScale=1.5
fondo.xScale=1.5

--Eventos
up:addEventListener('tap',upp)
down:addEventListener('tap',dw)
left:addEventListener('tap',lf)
right:addEventListener('tap',rg)

-- Agregar características físicas al personaje
fisica.addBody(personaje_frente, "dynamic", {density=1.0, friction=0,  gravityScale=0})
fisica.addBody(personaje_espalda, "dynamic", {density=1.0, friction=0,  gravityScale=0})
fisica.addBody(personaje_izquierda, "dynamic", {density=1.0, friction=0,  gravityScale=0})
fisica.addBody(personaje_derecha, "dynamic", {density=1.0, friction=0,  gravityScale=0})

fisica.addBody(pared1,"static")
fisica.addBody(pared2,"static")
fisica.addBody(pared3,"static")
fisica.addBody(pared4,"static")
