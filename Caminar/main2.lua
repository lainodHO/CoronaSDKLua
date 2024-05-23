--Archivos multimedia
local up=display.newImage"up.png"
local down=display.newImage"down.png"
local left=display.newImage"left.png"
local right=display.newImage"right.png"

local cx=display.contentCenterX; local cy=display.contentCenterY

up.xScale=0.05;up.yScale=0.05;up.x=display.contentCenterX;
down.xScale=0.05;down.yScale=0.05;down.x=display.contentCenterX;down.y=display.contentHeight;
left.xScale=0.05;left.yScale=0.05;left.x=20;left.y=display.contentCenterY;
right.xScale=0.05;right.yScale=0.05;right.x=display.contentWidth-20;right.y=display.contentCenterY;

local infspr = {width=32, height=40, numFrames=16, sheetcontentWidth=128, sheetcontentHeight=160}
shspr=graphics.newImageSheet("trainer.png",infspr)
local sprup = {name="downmv", start=13, count=4, time=500, loopCount=0, loopDirection="forward"}
local sprdown = {name="downmv", start=1, count=4, time=500, loopCount=0, loopDirection="forward"}
local sprleft = {name="downmv", start=5, count=4, time=500, loopCount=0, loopDirection="forward"}
local sprright = {name="downmv", start=9, count=4, time=500, loopCount=0, loopDirection="forward"}

local trainerup=display.newSprite(shspr,sprup)
trainerup.x=cx;trainerup.y=cy
trainerup.isVisible=false

local trainerdown=display.newSprite(shspr,sprdown)
trainerdown.x=cx; trainerdown.y=cy
trainerdown.isVisible=false

local trainerleft=display.newSprite(shspr,sprleft)
trainerleft.x=cx;trainerleft.y=cy
trainerleft.isVisible=false

local trainerright=display.newSprite(shspr,sprright)
trainerright.x=cx;trainerright.y=cy
trainerright.isVisible=false

--Funciones
local function mup(e)
  trainerup.isVisible=true;trainerdown.isVisible=false;trainerleft.isVisible=false;trainerright.isVisible=false;
  cy=cy-5;
  trainerup.y=cy;
  trainerdown.y=cy;
  trainerleft.y=cy;
  trainerright.y=cy;
  trainerup:play()
end
local function mdown(e)
  trainerup.isVisible=false;trainerdown.isVisible=true;trainerleft.isVisible=false;trainerright.isVisible=false;
  cy=cy+5;
  trainerup.y=cy;
  trainerdown.y=cy;
  trainerleft.y=cy;
  trainerright.y=cy;
  trainerdown:play()
end
local function mleft(e)
  trainerup.isVisible=false;trainerdown.isVisible=false;trainerleft.isVisible=true;trainerright.isVisible=false;
  cx=cx-5;
  trainerup.x=cx;
  trainerdown.x=cx;
  trainerleft.x=cx;
  trainerright.x=cx;
  trainerleft:play()
end
local function mright(e)
  trainerup.isVisible=false;
  trainerdown.isVisible=false;
  trainerleft.isVisible=false;
  trainerright.isVisible=true;
  cx=cx+5;
  trainerup.x=cx;
  trainerdown.x=cx;
  trainerleft.x=cx;
  trainerright.x=cx;
  trainerright:play()
end
--Eventos
up:addEventListener("tap",mup)
down:addEventListener("tap",mdown)
left:addEventListener("tap",mleft)
right:addEventListener("tap",mright)
