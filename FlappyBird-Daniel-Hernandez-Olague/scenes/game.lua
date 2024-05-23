-- -----------------------------------------------------------------------------------
-- Importar Librerias
-- -----------------------------------------------------------------------------------
local composer = require("composer")
local relayout = require("relayout")
local utilities = require("utilities")
local nube0 =display.newImage"nube.png"
local nube =display.newImage"nube.png"
local nube1 =display.newImage"nube.png"
local nube2 =display.newImage"nube.png"
local nube3 =display.newImage"nube.png"


local datosimagen = {width=100, height=100, numFrames=12, sheetcontentWidth=400, sheetcontentHeight=300}
plant= graphics.newImageSheet("Plant.png",datosimagen)
-----------------------------------------
--Tercer Paso definir las caracteristicas de la animacion
local MovePlant1 ={
  name="Plant1",
  start=1,
  count=4,
  time=6000,
  loopCount=0,
  loopDirection="forward",
}
local MovePlant2 ={
  name="Plant2",
  start=5,
  count=8,
  time=6000,
  loopCount=0,
  loopDirection="forward",
}
local MovePlant3 ={
  name="Plant3",
  start=9,
  count=12,
  time=6000,
  loopCount=0,
  loopDirection="forward",
}
local MovePlant4 ={
  name="Plant4",
  start=5,
  count=8,
  time=6000,
  loopCount=0,
  loopDirection="forward",
}
local MovePlant5 ={
  name="Plant5",
  start=1,
  count=4,
  time=6000,
  loopCount=0,
  loopDirection="forward",
}
--crear sprite
 local platt1 = display.newSprite (plant,MovePlant1);
platt1.x=60
platt1.y=680
platt1:play()

 local platt2 = display.newSprite (plant,MovePlant2);
platt2.x=120
platt2.y=680
platt2:play()

 local platt3 = display.newSprite (plant,MovePlant3);
platt3.x=180
platt3.y=680
platt3:play()

 local platt4 = display.newSprite (plant,MovePlant4);
platt4.x=240
platt4.y=680
platt4:play()

 local platt5 = display.newSprite (plant,MovePlant5);
platt5.x=300
platt5.y=680
platt5:play()
-----------------------------------------
---Posiciones
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
----Tamaños
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
----Movimientos
transition.to(nube0,{x=display.contentWidth+300,time= 100000})
transition.to(nube,{x=display.contentWidth+300,time= 100000})
transition.to(nube1,{x=display.contentWidth+300,time=100000})
transition.to(nube2,{x=display.contentWidth+300,time=100000})
transition.to(nube3,{x=display.contentWidth+300,time=100000})
-- -----------------------------------------------------------------------------------
-- Declarar variables
-- -----------------------------------------------------------------------------------
-- Interfaz
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scena
local scene = composer.newScene()

-- Grupos
local grpMain
local grpWorld
local grpHud

-- Sonidos
local sndFlap = audio.loadStream("flap.wav")
local sndCrash = audio.loadStream("crash.wav")
local sndScore = audio.loadStream("score.mp3")
local sndScore1 = audio.loadStream("score1.mp3")
local BackSound = audio.loadStream("backsound.mp3")
 audio.play(BackSound)
 
-- Variables
local pipes = {}
local backgrounds = {}
local canAddPipe = 0
local hasStarted = false
local score = 0
local bird
local lblScore

-- Agregar pipe
local function addPipe()

    local distanceBetween = math.random(120, 200)
    local yPosition = math.random(150, _H - 150)

    local pTop = display.newImageRect(grpWorld, "pipe.png", 50, 600)
    pTop.x = _W + 50
    pTop.y = yPosition - (distanceBetween / 2) - 300
    pTop.type = "pipe"
    pTop.xScale = -1
    pTop.rotation = -180
    pipes[#pipes+1] = pTop

    local pBottom = display.newImageRect(grpWorld, "pipe.png", 50, 600)
    pBottom.x = _W + 50
    pBottom.y = yPosition + (distanceBetween / 2) + 300
    pBottom.type = "pipe"
    pipes[#pipes+1] = pBottom

    local pSensor = display.newRect(grpWorld, _W + 80, _CY, 5, _H)
    pSensor.fill = { 0, 1, 0 }
    pSensor.type = "sensor"
    pSensor.alpha = 0
    pipes[#pipes+1] = pSensor
end

local function touch( event )

    if event.phase == "began" then
        if not hasStarted then
            hasStarted = true
        end

        audio.play(sndFlap)

        bird.velocity = 10
    end
end

local function checkCollision(obj1, obj2)
    local left  = (obj1.contentBounds.xMin) <= obj2.contentBounds.xMin and (obj1.contentBounds.xMax) >= obj2.contentBounds.xMin
    local right = (obj1.contentBounds.xMin) >= obj2.contentBounds.xMin and (obj1.contentBounds.xMin) <= obj2.contentBounds.xMax
    local up    = (obj1.contentBounds.yMin) <= obj2.contentBounds.yMin and (obj1.contentBounds.yMax) >= obj2.contentBounds.yMin
    local down  = (obj1.contentBounds.yMin) >= obj2.contentBounds.yMin and (obj1.contentBounds.yMin) <= obj2.contentBounds.yMax
    return (left or right) and (up or down)
end

--
-- Actualizar

local function update()
    if hasStarted and bird.crashed == false then
        for i = #backgrounds, 1, -1 do
            local b = backgrounds[i]
            b:translate( -2, 0 )

            if b.x < -(_W / 2) then
                b.x = b.x + (_W * 3)
            end
        end
        for i = #pipes, 1, -1 do
            local object = pipes[i]
            object:translate( -2, 0 )

            if object.x < -100 then
                local child = table.remove(pipes, i)

                if child ~= nil then
                    child:removeSelf()
                    child = nil
                end
            end

            if checkCollision(object, bird) then
                if object.type == "sensor" then
                    print("SCOOORE")

                    score = score + 1

                    lblScore.text = score .. "p"

                    print("Score: " .. score)

                    local child = table.remove(pipes, i)

                    audio.play(sndScore)
                     audio.play(sndScore1)

                    if child ~= nil then
                        child:removeSelf()
                        child = nil
                    end
                else
                    audio.play(sndCrash)
                    print("DIIIIIIIIIIEEE")

                    utilities:setPreviousScore(score)

                    bird.crashed = true

                    transition.to(bird, {time=200, y=_H - 30, onComplete=function() 
                        composer.gotoScene("scenes.gameover")
                    end})
                end
            end
        end

        --

        bird.velocity = bird.velocity - bird.gravity
        bird.y = bird.y - bird.velocity

        if bird.y > _H or bird.y < 0 then
            print("DIIIIIIIEEE")

            bird.crashed = true

            utilities:setPreviousScore(score)

            audio.play(sndCrash)
            audio.play(sndCrash1)

            transition.to(bird, {time=200, y=_H - 30, onComplete=function() 
                composer.gotoScene("scenes.gameover")
            end})
        end

        --

        if canAddPipe > 100 then
            addPipe()
        
            canAddPipe = 0
        end

        canAddPipe = canAddPipe + 1
    end
end



-- -----------------------------------------------------------------------------------
-- Funciones de eventos de escena
-- -----------------------------------------------------------------------------------

-- crear ()
function scene:create( event )
    print("scene:create - game")

    -- Crear grupo principal e insertarlo en la escena.
    grpMain = display.newGroup()

    self.view:insert(grpMain)

    grpWorld = display.newGroup()
    grpMain:insert(grpWorld)

    grpHud = display.newGroup()
    grpMain:insert(grpHud)

    -- Insertar objetos en grpMain aquí

    -- Fondos

    local b1 = display.newImageRect(grpWorld, "background.png", _W, _H)
    b1.x = _CX
    b1.y = _CY
    backgrounds[#backgrounds+1] = b1

    local b2 = display.newImageRect(grpWorld, "background.png", _W, _H)
    b2.x = _CX + _W
    b2.y = _CY
    backgrounds[#backgrounds+1] = b2

    local b3 = display.newImageRect(grpWorld, "background.png", _W, _H)
    b3.x = _CX + (_W * 2)
    b3.y = _CY
    backgrounds[#backgrounds+1] = b3

    -- Aqui agregamos al Personaje a usar en este caso el pajaro

    bird = display.newImageRect( grpWorld, "flappy.png", 25, 20 )
    bird.x = 100
    bird.y = _CY
    bird.velocity = 0
    bird.crashed = false
    bird.gravity = 0.6

    --
    -- Etiquetta de puntaje

    lblScore = display.newText("0p", _CX, 180, "PressStart2P-Regular.ttf", 40)
    grpHud:insert(lblScore)

    Runtime:addEventListener("enterFrame", update)
    Runtime:addEventListener("touch", touch)
end



-- Mostrar()
function scene:show( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end



-- Esconder()
function scene:hide( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end



-- destruir()
function scene:destroy(event)
  if event.phase == "will" then
    Runtime:removeEventListener("enterFrame", update)
    Runtime:removeEventListener("touch", touch)
  end
end



-- -----------------------------------------------------------------------------------
-- Listeners de función de evento de escena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene


