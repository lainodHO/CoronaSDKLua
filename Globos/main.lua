--Iniciar Fisicas
local fisica=require('physics')
fisica.start()
fisica.setGravity(0,-9.81)
--Archivos multimedia
local fondo=display.newImage("imgs/fondo.jpg")
--Funciones
local function crear (e)
  globo=display.newImage('imgs/globo1.png')
  globo.xScale=.1
  globo.yScale=.1
  globo.x=e.x
  globo.y=e.y
  fisica.addBody(globo)--por defecto es dimanica la fisica
  
end
---eventos
fondo:addEventListener('tap', crear)