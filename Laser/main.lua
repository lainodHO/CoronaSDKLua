local fondo=display.newImage"Resource/ds.jpg"
local xwing=display.newImage"Resource/spaceship1.png"
local laser=audio.loadSound("laser.mp3")
fondo.x=display.contentCenterX
fondo.y=display.contentCenterY
xwing.width=60
xwing.height=60
xwing.x=display.contentCenterX
xwing.y=display.contentHeight
----Funciones
local function mover(e)
  xwing.x=e.x
end
--
local function disparar(e)
  audio.play(laser)
  rayo=display.newImage('Resource/laser.png')
  rayo.xScale=.1
  rayo.yScale=.1
  rayo.x=xwing.x
  rayo.y=xwing.y
  transition.to(rayo,{y=-100,time=1000})
  end
----Eventos
xwing:addEventListener('touch',mover)
xwing:addEventListener('tap',disparar)
----Fisicas





local obj=display.newImage("Resource/brujita.png")
local random=math.random
obj.width=60
obj.height=60
obj.yScale=1
obj.xScale=1

 obj.x=random(0,display.contentWidth)
obj.y=random(0,200)
----Funciones
local function mover(e)
 transition.to(obj,{x=random(0,display.contentWidth),y=random(0,200),time=random(50,300)})
  end
timer.performWithDelay(500,mover,0)