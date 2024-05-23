-- -----------------------------------------------------------------------------------
-- Importar
-- -----------------------------------------------------------------------------------
local composer = require("composer")
local relayout = require("relayout")
local utilities = require("utilities")
-- -----------------------------------------------------------------------------------
-- Establecer variables
-- -----------------------------------------------------------------------------------
-- Disposición
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
-- Escena
local scene = composer.newScene()
-- Grupos
local grpMain
-- -----------------------------------------------------------------------------------
-- Funciones de eventos de escena
-- ---------------------------------------------------------------------------------
-- crear()
function scene:create( event )
  print("scene:create - menu")
  
  -- Crear grupo principal e insertarlo en la escena.
  grpMain = display.newGroup()
  self.view:insert(grpMain)
  
  -- Insertar objetos en grpMain aquí
  local bg = display.newImageRect("background.png", _W, _H)
  bg.x = _CX
  bg.y = _CY
  grpMain:insert(bg)
  
  -- Reemplazar el texto por una imagen llamada "start"
  local btnPlay = display.newImage("start.png", _CX, _CY)
  grpMain:insert(btnPlay)
  
  btnPlay.yScale=.2
  btnPlay.xScale=.2

  btnPlay:addEventListener("tap", function() 
    composer.gotoScene("scenes.game")
  end)
end



-- mostrar()
function scene:show( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end
-- esconder()
function scene:hide( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
  end
end
-- destruir()
function scene:destroy(event)
  if event.phase == "will" then
  end
end
-- -----------------------------------------------------------------------------------
-- Oyentes de función de evento de escena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
return scene
