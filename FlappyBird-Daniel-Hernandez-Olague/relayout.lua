-- Relayout
-- Esta biblioteca ayuda a posicionar elementos en la pantalla durante el evento de redimensionamiento
local _M = {}
-- Nombres cortos para el ancho/alto de la pantalla y las coordenadas de su centro
-- Se actualizan durante el evento de redimensionamiento
_M._W, _M._H = display.actualContentWidth, display.actualContentHeight
_M._CX, _M._CY = _M._W / 2, _M._H / 2
_M.w = display.contentWidth
_M.h = display.contentHeight
-- Realizar el reajuste real para cada objeto o función oyente
local function relayout()
    for i = #_M.relayoutListeners, 1, -1 do
        local l = _M.relayoutListeners[i]
        if type(l) == 'function' then -- El oyente es una función simple
            l()
        elseif type(l) == 'table' then -- El oyente es un objeto de visualización
            if not l.x then -- Eliminar objetos removeSelf()'ed de la lista
                table.remove(_M.relayoutListeners, i)
            else
                if type(l.relayout) == 'function' then -- El objeto tiene la función object:relayout()
                    l:relayout()
                else -- Si no, realizar el reposicionamiento automático
                    local r = l._relayout
                    if r.anchor then -- ¿A qué esquina de la pantalla se acerca más el objeto?
                        l.x, l.y = r.anchor.x * _M._W + r.anchor.offset.x, r.anchor.y * _M._H + r.anchor.offset.y
                    end
                    if r.width then -- Ancho completo de la pantalla
                        l.width = _M._W
                    end
                    if r.height then -- Altura completa de la pantalla
                        l.height = _M._H
                    end
                end
            end
        end
    end
end
-- Agregar un oyente a la lista interna
-- El oyente puede ser una función, un objeto con un método :relayout() o simplemente un objeto de visualización
-- Si es un objeto de visualización ordinario, calcular datos para su reposicionamiento automático
function _M.add(listener)
    if not _M.relayoutListeners then
        _M.relayoutListeners = {}
        Runtime:addEventListener('resize', relayout)
    end
    table.insert(_M.relayoutListeners, listener)
    if type(listener) == 'table' and not listener.relayout then
        -- Datos para el reposicionamiento automático
        listener._relayout = {}
        if listener.width == _M._W then -- Ancho completo de la pantalla
            listener._relayout.width = true
        end
        if listener.height == _M._H then -- Altura completa de la pantalla
            listener._relayout.height = true
        end
        local anchor = {}
        for anchorX = 0, 1, 0.5 do -- Iterar a través de todas las esquinas y bordes de la pantalla y encontrar la más cercana
            for anchorY = 0, 1, 0.5 do
                local distance = math.sqrt((anchorX * _M._W - listener.x) ^ 2 + (anchorY * _M._H - listener.y) ^ 2)
                if not anchor.distance or anchor.distance > distance then
                    anchor.x, anchor.y, anchor.distance = anchorX, anchorY, distance
                    anchor.offsetX, anchor.offsetY = listener.x - anchorX * _M._W, listener.y - anchorY * _M._H
                end
            end
        end
        if anchor.distance < math.max(_M._W * 0.33, _M._H * 0.33) then
            listener._relayout.anchor = { -- Agregar la ancla encontrada a los datos de reposicionamiento
                x = anchor.x, y = anchor.y,
                offset = {
                    x = anchor.offsetX, y = anchor.offsetY
                }
            }
        end
    end
    return listener
end
-- Eliminar el oyente dado de la lista interna
function _M.remove(listener)
    if not listener or not _M.relayoutListeners then return end
    local ind = table.indexOf(_M.relayoutListeners, listener)
    if ind then
        table.remove(_M.relayoutListeners, ind)
        if #_M.relayoutListeners == 0 then
            _M.removeAll()
        end
    end
end
function _M.removeAll()
    Runtime:removeEventListener('resize', relayout)
    _M.relayoutListeners = nil
end
-- Siempre escuchar el evento de redimensionamiento para actualizar las variables
Runtime:addEventListener('resize', function()
    _M._W, _M._H = display.actualContentWidth, display.actualContentHeight
    _M._CX, _M._CY = _M._W / 2, _M._H / 2 -- display.contentCenterX/Y no funcionan aquí, porque no son display.actualContentCenterX/Y
    -- Mover el área de contenido de la aplicación de Corona SDK para que siempre esté en la esquina superior izquierda
    -- Es posible que no desees esto para tu aplicación
    local stage = display.getCurrentStage()
    stage.x, stage.y = display.screenOriginX, display.screenOriginY
end)
return _M
