-- -----------------------------------------------------------------------------------
-- Importar
-- -----------------------------------------------------------------------------------

local composer = require("composer")  -- Importar la biblioteca Composer para gestionar escenas
local relayout = require("relayout")  -- Importar la biblioteca relayout para el diseño de la interfaz
local utilities = require("utilities")  -- Importar la biblioteca utilities para funciones utilitarias


-- -----------------------------------------------------------------------------------
-- Establecer variables
-- -----------------------------------------------------------------------------------

-- Diseño
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY  -- Variables para dimensiones y posición central de la pantalla

-- Escena
local scene = composer.newScene()  -- Crear una nueva escena en Composer

-- Grupos
local grpMain  -- Declarar un grupo principal


-- -----------------------------------------------------------------------------------
-- Funciones de eventos de la escena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
  print("scene:create - gameover")  -- Imprimir mensaje en la consola

  -- Crear el grupo principal y insertarlo en la escena
  grpMain = display.newGroup()
  self.view:insert(grpMain)

  -- Insertar objetos en grpMain aquí

  local bg = display.newImageRect("background.png", _W, _H)  -- Crear un fondo con la imagen "background.png"
  bg.x = _CX  -- Establecer la posición X en el centro de la pantalla
  bg.y = _CY  -- Establecer la posición Y en el centro de la pantalla
  grpMain:insert(bg)  -- Insertar el fondo en el grupo principal

  local isHighScore = utilities:setHighScore(utilities:getPreviousScore())  -- Verificar si la puntuación actual es un nuevo récord

  local lblScore = display.newText("Puntaje: " .. utilities:getPreviousScore(), _CX, _CY, "PressStart2P-Regular.ttf", 20)  -- Crear un texto con la puntuación anterior
  grpMain:insert(lblScore)  -- Insertar el texto de la puntuación en el grupo principal

  local lblHighScore = display.newText("Puntaje mas alto: " .. utilities:getHighscore(), _CX, _CY + 50, "PressStart2P-Regular.ttf", 16)  -- Crear un texto con el récord actual
  grpMain:insert(lblHighScore)  -- Insertar el texto del récord en el grupo principal

  if isHighScore == true then
    local lblNewHighscore = display.newText("Nuevo puntaje mas alto", _CX, _CY - 50, "PressStart2P-Regular.ttf", 20)  -- Crear un texto indicando un nuevo récord
    grpMain:insert(lblNewHighscore)  -- Insertar el texto de nuevo récord en el grupo principal
  end
end

-- show()
function scene:show(event)
  if (event.phase == "will") then
    -- Código a ejecutar antes de que la escena se muestre
  elseif (event.phase == "did") then
    -- Código a ejecutar después de que la escena se haya mostrado
  end
end

-- hide()
function scene:hide(event)
  if (event.phase == "will") then
    -- Código a ejecutar antes de que la escena se oculte
  elseif (event.phase == "did") then
    -- Código a ejecutar después de que la escena se haya ocultado
  end
end

-- destroy()
function scene:destroy(event)
  if event.phase == "will" then
    -- Código a ejecutar antes de destruir la escena
  end
end

-- -----------------------------------------------------------------------------------
-- Escuchar funciones de eventos de la escena
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene  -- Devolver la escena para su uso en Composer
