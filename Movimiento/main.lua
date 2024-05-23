local obj=display.newImage("imgs/brujita.png")
local random=math.random
obj.width=60
obj.height=60
obj.yScale=1
obj.xScale=1

 obj.x=random(0,display.contentWidth)
obj.y=random(0,200)
----Funciones
local function mover(e)
 transition.to(obj,{x=random(0,display.contentWidth),y=random(0,200),time=random(50,300)})
  end
timer.performWithDelay(500,mover,0)