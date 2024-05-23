-- -----------------------------------------------------------------------------------
-- Importar
-- -----------------------------------------------------------------------------------
local composer = require("composer")
local relayout = require("libs.relayout")
-- -----------------------------------------------------------------------------------
-- Importar clases
-- -----------------------------------------------------------------------------------
local utilities = require("classes.utilities")
-- -----------------------------------------------------------------------------------
-- Establecer variables
-- -----------------------------------------------------------------------------------
-- Diseño
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
-- Escena
local escena = composer.newScene()
-- Grupos
local grpPrincipal
-- -----------------------------------------------------------------------------------
-- Funciones de eventos de la escena
-- -----------------------------------------------------------------------------------
-- create()
function escena:create(evento)
  print("escena:create - vacío")
  -- Crear grupo principal e insertar en la escena
  grpPrincipal = display.newGroup()
  self.view:insert(grpPrincipal)
  -- Insertar objetos en grpPrincipal aquí
end
-- show()
function escena:show(evento)
  if (evento.phase == "will") then
  elseif (evento.phase == "did") then
  end
end
-- hide()
function escena:hide(evento)
  if (evento.phase == "will") then
  elseif (evento.phase == "did") then
  end
end
-- destroy()
function escena:destroy(evento)
  if evento.phase == "will" then
  end
end
-- -----------------------------------------------------------------------------------
-- Escuchar funciones de eventos de la escena
-- -----------------------------------------------------------------------------------
escena:addEventListener("create", escena)
escena:addEventListener("show", escena)
escena:addEventListener("hide", escena)
escena:addEventListener("destroy", escena)
-- -----------------------------------------------------------------------------------
return escena
