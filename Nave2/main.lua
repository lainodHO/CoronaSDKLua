---Caragar librerias
local fisica=require('physics')
fisica.start()
---Cargar multimedia
local background = displ.newImage"imgs/fondo.jpg"
local aste = display.newImage('imgs/asterik.png')
local nave = display.newImage"imgs/nave.png"
local suelo = display.newImage('imgs/suelo.png')
local li=display.newImage"imgs/fondo.jpg"
local ld=display.newImage"imgs/fondo.jpg"
local msg=display.newText({text='Hola Mundito'})
---ajuste de multimedia
msg.x=display.contentCenterX
msg.y=0
msg.size=20
msg.rotation=45
aste.x=display.contentCenterX
aste.y=0
aste.width=50
aste.height=50
suelo.x=display.contentCenterX; suelo.height=84; suelo.width=383; suelo.y=display.contentHeight+87;
---Funciones
local function pum(e)
  aste.isVisible=false
  globo=display.newImage('imgs/globo1.png')
  globo.xScale=.1
  globo.yScale=.1
  globo.x=e.x
  globo.y=e.y
  fisica.addBody(globo)--por defecto es dimanica la fisica
   fisica.setGravity(0,-9.81)
end
---eventos
fondo:addEventListener('tap', crear)
  
  end
---Eventos
aste:addEventListener('collision'pum)
---Fisica
fisica.addBody(aste)
fisica.addBody(suelo,'static')
fisica.addBody(li,'static')
fisica.addBody(ld,'static')