----Agregamos fisica 
fisica =require("physics"); 
fisica.start()
----Cargar Multimedia
local btn=display.newImage"imgs/panel.png"
----Contador
local puntos = 0
local Contador = display.newText("Canastas: 0", 170, -70, native.systemFont, 16)
----Cargar Sonidos
local gg=audio.loadSound("gg.mp3")
local rock=audio.loadSound("rock.mp3")
----Lados
local techo=display.newRect(0,display.contentHeight*-0.5,display.actualContentWidth*2,5)
local ld=display.newRect(0,100,3,display.contentHeight*2)
local li=display.newRect(320,100,3,display.contentHeight*2)
----Rectangulos con su horientacion y posision
local r=display.newRect(250,20,10,100)
r:rotate(60)
local r1=display.newRect(250,220,10,100)
r1:rotate(60)
local r2=display.newRect(250,420,10,100)
r2:rotate(60)
local r3=display.newRect(70,70,10,100)
r3:rotate(120)
local r4=display.newRect(70,270,10,100)
r4:rotate(120)
local r5=display.newRect(70,470,10,100)
r5:rotate(120)
local cuadro=display.newRect(160,580,50,25)
---Horientaciones y tamaños
btn.x = display.contentCenterX
btn.y = -40
btn.yScale=.1
btn.xScale=.1
btn.width=4000
----Funciones
local function crear(e)
esfera=display.newCircle(e.x,e.y,10)
fisica.addBody(esfera,"dynamic",{bounce=.5, radius=10})
  --Cambiar el color del piso cada vez que pulse
esfera:setFillColor(math.random(),math.random(),math.random())
techo:setFillColor(math.random(),math.random(),math.random())
cuadro:setFillColor(math.random(),math.random(),math.random())
li:setFillColor(math.random(),math.random(),math.random())
ld:setFillColor(math.random(),math.random(),math.random())
r:setFillColor(math.random(),math.random(),math.random())
r1:setFillColor(math.random(),math.random(),math.random())
r2:setFillColor(math.random(),math.random(),math.random())
r3:setFillColor(math.random(),math.random(),math.random())
r4:setFillColor(math.random(),math.random(),math.random())
r5:setFillColor(math.random(),math.random(),math.random())
end
function encestar(e)
audio.play(gg)
   --audio.play(rock)
  display.remove(esfera)
  puntos = puntos + 1
  Contador.text = "Canastas: " .. puntos
end
----Eventos
btn:addEventListener("tap", crear)
cuadro:addEventListener("collision", encestar)
----Fisicas
fisica.addBody(li,'static')
fisica.addBody(ld,'static')
fisica.addBody(techo,"static")
fisica.addBody(cuadro,"static")
fisica.addBody(r,"static")
fisica.addBody(r1,"static")
fisica.addBody(r2,"static")
fisica.addBody(r3,"static")
fisica.addBody(r4,"static")
fisica.addBody(r5,"static")