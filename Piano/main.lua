--Cargar imagenes
local t1=display.newImage"imgs/1.png"
local t2=display.newImage"imgs/2.png"
local t3=display.newImage"imgs/3.png"
local t4=display.newImage"imgs/4.png"
local t5=display.newImage"imgs/5.png"
local t6=display.newImage"imgs/6.png"
local t7=display.newImage"imgs/7.png"
local t8=display.newImage"imgs/8.png"


-- Ajustar imagen
t1.x=-30
t1.height=display.contentHeight*2
t1.width=60

t2.x=30
t2.height=display.contentHeight*2
t2.width=60

t3.x=90
t3.height=display.contentHeight*2
t3.width=60

t4.x=150
t4.height=display.contentHeight*2
t4.width=60

t5.x=270
t5.height=display.contentHeight*2
t5.width=60

t6.x=350
t6.height=display.contentHeight*2
t6.width=60

t7.x=430
t7.height=display.contentHeight*2
t7.width=60

t8.x=510
t8.height=display.contentHeight*2
t8.width=60

--Asignar los eventos
local function r1 ()
  local s1=audio.loadSound"sounds/1.mp3"
  audio.play(s1)
end

local function r2 ()
  local s2=audio.loadSound"sounds/2.mp3"
  audio.play(s2)
end

local function r3 ()
  local s3=audio.loadSound"sounds/3.mp3"
  audio.play(s3)
end

local function r4 ()
  local s4=audio.loadSound"sounds/4.mp3"
  audio.play(s4)
end

local function r5 ()
  local s5=audio.loadSound"sounds/5.mp3"
  audio.play(s5)
end

local function r6 ()
  local s6=audio.loadSound"sounds/6.mp3"
  audio.play(s6)
end

local function r7 ()
  local s7=audio.loadSound"sounds/7.mp3"
  audio.play(s7)
end

local function r8 ()
  local s8=audio.loadSound"sounds/8.mp3"
  audio.play(s8)
end
--Eventos
t1:addEventListener("tap",r1)
t2:addEventListener("tap",r2)
t3:addEventListener("tap",r3)
t4:addEventListener("tap",r4)
t5:addEventListener("tap",r5)
t6:addEventListener("tap",r6)
t7:addEventListener("tap",r7)
t8:addEventListener("tap",r8)
