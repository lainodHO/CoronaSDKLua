-- -----------------------------------------------------------------------------------
-- Crear clase y variables
-- -----------------------------------------------------------------------------------
local GGData = require("GGData")
-- -----------------------------------------------------------------------------------
-- Crear clase y variables
-- -----------------------------------------------------------------------------------
local utilities = {}
local db = GGData:new("db")
-- -----------------------------------------------------------------------------------
-- Inicializar la base de datos
-- -----------------------------------------------------------------------------------
if not db.highscore then
  db:set("highscore", 0)
  db:save()
end
if not db.previousScore then
    db:set("previousScore", 0)
    db:save()
end
-- -----------------------------------------------------------------------------------
-- Puntuación más alta (Highscore)
-- -----------------------------------------------------------------------------------
function utilities:getHighscore()
    return db.highscore
end
function utilities:getPreviousScore()
    return db.previousScore
end
function utilities:setHighScore(score)
    if score > db.highscore then
        print("Nueva puntuación más alta")
        db:set("highscore", score)
        db:save()
        return true
    else
        return false
    end
end
function utilities:setPreviousScore(score)
    db:set("previousScore", score)
    db:save()
end
-- -----------------------------------------------------------------------------------
-- Devolver
-- -----------------------------------------------------------------------------------
return utilities
