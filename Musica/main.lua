--Cargar imagenes
local fondo=display.newImage"imgs/fondo.jpg"
local t1=display.newImage"imgs/evangelion.png"
local t2=display.newImage"imgs/chords.png"
local t3=display.newImage"imgs/powerwolf.png"
local t4=display.newImage"imgs/space.png"
local t5=display.newImage"imgs/wars.png"
local t6=display.newImage"imgs/undertale.png"
local t7=display.newImage"imgs/eminem.jpg"
local t8=display.newImage"imgs/primaveras.jpg"


-- Ajustar imagen
fondo.y=display.contentCenterY;
fondo.x=display.contentCenterX;
fondo.yScale=2
fondo.xScale=2

t1.x=80
t1.y=10
t1.height=display.contentHeight*2
t1.width=125
t1.height=125

t2.x=240
t2.y=10
t2.height=display.contentHeight*2
t2.width=125
t2.height=125

t3.x=80
t3.y=150
t3.height=display.contentHeight*2
t3.width=125
t3.height=125

t4.x=240
t4.y=150
t4.height=display.contentHeight*2
t4.width=125
t4.height=125

t5.x=80
t5.y=280
t5.height=display.contentHeight*2
t5.width=125
t5.height=125

t6.x=240
t6.y=280
t6.height=display.contentHeight*2
t6.width=125
t6.height=125

t7.x=80
t7.y=440
t7.height=display.contentHeight*2
t7.width=125
t7.height=125

t8.x=240
t8.y=440
t8.height=display.contentHeight*2
t8.width=125
t8.height=125

--Asignar los eventos
local function r1 ()
  local s1=audio.loadSound"sounds/zankoku.mp4"
  audio.play(s1)
end

local function r2 ()
  local s2=audio.loadSound"sounds/chords.mp4"
  audio.play(s2)
end

local function r3 ()
  local s3=audio.loadSound"sounds/wolf.mp4"
  audio.play(s3)
end

local function r4 ()
  local s4=audio.loadSound"sounds/sad.mp4"
  audio.play(s4)
end

local function r5 ()
  local s5=audio.loadSound"sounds/star.mp4"
  audio.play(s5)
end

local function r6 ()
  local s6=audio.loadSound"sounds/sans.mp4"
  audio.play(s6)
end

local function r7 ()
  local s7=audio.loadSound"sounds/emi.mp4"
  audio.play(s7)
end

local function r8 ()
  local s8=audio.loadSound"sounds/vice.mp4"
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

