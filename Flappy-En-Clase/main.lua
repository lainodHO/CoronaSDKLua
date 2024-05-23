local fisica=require('physics')
fisica.start()
fisica.setGravity(0,.2)
local ave = display.newImage"imgs/ave.png"
local caja = display.newImage"imgs/caja.png"

ave.y=0
ave.x=0
caja.x=display.contentCenterX
caja.y=display.contentHeight
ave.width=60
ave.height=60

transition.to(ave,{x=display.contentWidth,time=10000})
----Funciones 
local function levantar (e)
  ave.y=ave.y-50
end
----Eventos
caja:addEventListener('tap', levantar)

----Fisiscas
fisica.addBody(ave)