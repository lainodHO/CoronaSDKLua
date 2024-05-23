--0. cargar librerias
fisica =require("physics"); fisica.start()
--Iniciar Variables
local fondo=display.newImage"imgs/aereo.png"
local avion =display.newImage"imgs/avion.png"
local avion1 =display.newImage"imgs/avion1.png"
local nube0 =display.newImage"imgs/nube.png"
local nube =display.newImage"imgs/nube.png"
local nube1 =display.newImage"imgs/nube.png"
local nube2 =display.newImage"imgs/nube.png"
local nube3 =display.newImage"imgs/nube.png"
local motorsound= audio.loadSound("sounds/motor.mp4")
local concord= audio.loadSound("sounds/concord.mp4")
audio.play(motorsound)
audio.play(concord)
--Posiciones
fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;

avion.y=110
avion.x=-100

avion1.y=60
avion1.x=550

nube0.y=20
nube0.x=-750

nube.y=20
nube.x=-100

nube1.y=70
nube1.x=250

nube2.y=20
nube2.x=550

nube3.y=70
nube3.x=-450


--Tamaños
fondo.yScale=1.5
fondo.xScale=1.5

avion.width=100
avion.height=70

avion1.width=100
avion1.height=70

nube0.width=100
nube0.height=70

nube.width=100
nube.height=70

nube1.width=100
nube1.height=70

nube2.width=100
nube2.height=70

nube3.width=100
nube3.height=70
--acciones 
transition.to(avion,{x=display.contentWidth+200,time=100000})
transition.to(avion1,{x=display.contentWidth-800,time=100000})
transition.to(nube0,{x=display.contentWidth+300,time= 100000})
transition.to(nube,{x=display.contentWidth+300,time= 100000})
transition.to(nube1,{x=display.contentWidth+300,time=100000})
transition.to(nube2,{x=display.contentWidth+300,time=100000})
transition.to(nube3,{x=display.contentWidth+300,time=100000})
transition.to(fondo,{x=display.contentWidth-300,time=1000000})

--Funciones
local function crear()
  local gota = display.newImage"imgs/gota.png"
  local aleatorio = math.random(1,10)
   local aleatorio1 = math.random(-100,800)
  gota.width=aleatorio
    gota.height=aleatorio
    
  gota.x=aleatorio1
  fisica.addBody(gota,'dinamic',{ desity=1.0, friction=0.5, bounce=.5 })
end

timer.performWithDelay(math.random(10,100),crear,0)
