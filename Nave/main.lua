--0. cargar librerias
fisica =require("physics"); fisica.start()
--1. cargar imagenes, videos, sonidos
local background = display.newImage"imagenes/fondo.jpg"
local nave = display.newImage"imagenes/nave.png"
local suelo = display.newImage"imagenes/suelo.png"
local li=display.newImage"imagenes/fondo.jpg"
local ld=display.newImage"imagenes/fondo.jpg"
-- ajustar imagenes, videos, sonidos
li.width=2
li.height=display.contentHeight*3
li.x=0
li.y=-50
ld.width=2
ld.height=display.contentHeight*3
ld.x=display.contentWidth
ld.y=-50
--background
--background.width=display.contentWidth; background.x=display.contentCenterX
--background.height=display.contentHeight; background.y=display.contentCenterY
--suelo
suelo.x=display.contentCenterX; suelo.height=84; suelo.width=383; suelo.y=display.contentHeight+87;
--nave
nave.x=display.contentCenterX; nave.y=display.contentCenterY
--funciones
local function crear()
  local asteroid = display.newImage"imagenes/asterik.png"
  local aleatorio = math.random(30,100)
  asteroid.width=aleatorio
    asteroid.height=aleatorio
  asteroid.x=display.contentCenterX
  fisica.addBody(asteroid,'dinamic',{ desity=3.0, friction=0.5, bounce=1.0 })
end

local function mover(event)
  nave.x=event.x
   nave.y=event.y
end
--eventos
nave:addEventListener("touch",mover)


timer.performWithDelay(math.random(300,800),crear,0)

--fisicas
  nave.width=100
    nave.height=60
    
fisica.addBody(suelo,'static',{friction})
fisica.addBody(nave,'kinematic')
fisica.addBody(li,'static')
fisica.addBody(ld,'static')


