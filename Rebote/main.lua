
--Agregamos fisica 
fisica =require("physics"); 
fisica.start()
---multimedia


--dibujar el piso
local techo=display.newRect(0,display.contentHeight*-0.5,display.actualContentWidth*2,5)


 
 local c=display.newRect(200,20,20,50)
 local c1=display.newRect(240,20,20,50)
 local c2=display.newRect(280,20,20,50)
 local c3=display.newRect(320,20,20,50)
 local c4=display.newRect(360,20,20,50)
 local c5=display.newRect(160,20,20,50)
 local c6=display.newRect(120,20,20,50)
 local c7=display.newRect(80,20,20,50)
 local c8=display.newRect(40,20,20,50)
 local c9=display.newRect(0,20,20,50)
 
local c10=display.newRect(200,80,20,50)
 local c11=display.newRect(200,80,20,50)
 local c12=display.newRect(240,80,20,50)
 local c13=display.newRect(280,80,20,50)
 local c14=display.newRect(320,80,20,50)
 local c15=display.newRect(360,80,20,50)
 local c16=display.newRect(160,80,20,50)
 local c17=display.newRect(120,80,20,50)
 local c18=display.newRect(80,80,20,50)
 local c19=display.newRect(40,80,20,50)
 local c20=display.newRect(0,80,20,50)
 
local c21=display.newRect(200,140,20,50)
local c22=display.newRect(240,140,20,50)
local c23=display.newRect(280,140,20,50)
local c24=display.newRect(320,140,20,50)
local c25=display.newRect(360,140,20,50)
local c26=display.newRect(160,140,20,50)
local c27=display.newRect(120,140,20,50)
local c28=display.newRect(80, 140,20,50)
local c29=display.newRect(40, 140,20,50)
local c30=display.newRect(0,  140,20,50)

local ld=display.newRect(0,100,3,display.contentHeight*2)
local li=display.newRect(320,100,3,display.contentHeight*2)
--Barra mover
local barra=display.newRect(display.contentCenterX,480,80,10)
local esfera=display.newCircle(20000,20000,0,0)
 
--Funcion crear esferas
local function crear()
esfera=display.newCircle(math.random(0,display.contentWidth),400,10)
fisica.addBody(esfera,"dynamic",{bounce=1.1, radius=10})
  --Cambiar el color del piso cada vez que pulse
  esfera:setFillColor(math.random(),math.random(),math.random())
techo:setFillColor(math.random(),math.random(),math.random())
barra:setFillColor(math.random(),math.random(),math.random())
li:setFillColor(math.random(),math.random(),math.random())
ld:setFillColor(math.random(),math.random(),math.random())
c:setFillColor(math.random(),math.random(),math.random())
c1:setFillColor(math.random(),math.random(),math.random())
c2:setFillColor(math.random(),math.random(),math.random())
c3:setFillColor(math.random(),math.random(),math.random())
c4:setFillColor(math.random(),math.random(),math.random())
c5:setFillColor(math.random(),math.random(),math.random())
c6:setFillColor(math.random(),math.random(),math.random())
c7:setFillColor(math.random(),math.random(),math.random())
c8:setFillColor(math.random(),math.random(),math.random())
c9:setFillColor(math.random(),math.random(),math.random())
c10:setFillColor(math.random(),math.random(),math.random())
c11:setFillColor(math.random(),math.random(),math.random())
c12:setFillColor(math.random(),math.random(),math.random())
c13:setFillColor(math.random(),math.random(),math.random())
c14:setFillColor(math.random(),math.random(),math.random())
c15:setFillColor(math.random(),math.random(),math.random())
c16:setFillColor(math.random(),math.random(),math.random())
c17:setFillColor(math.random(),math.random(),math.random())
c18:setFillColor(math.random(),math.random(),math.random())
c19:setFillColor(math.random(),math.random(),math.random())
c20:setFillColor(math.random(),math.random(),math.random())
c21:setFillColor(math.random(),math.random(),math.random())
c22:setFillColor(math.random(),math.random(),math.random())
c23:setFillColor(math.random(),math.random(),math.random())
c24:setFillColor(math.random(),math.random(),math.random())
c25:setFillColor(math.random(),math.random(),math.random())
c26:setFillColor(math.random(),math.random(),math.random())
c27:setFillColor(math.random(),math.random(),math.random())
c28:setFillColor(math.random(),math.random(),math.random())
c29:setFillColor(math.random(),math.random(),math.random())
c30:setFillColor(math.random(),math.random(),math.random())
end
--funcion Mover Barra
local function moverbarra(event)
  barra.x=event.x
end

local function pum (e)
  display.remove(c) 
    c.isVisible=false
end
local function pum1 (e)
  display.remove(c1) 
  c1.isVisible=false
end
local function pum2 (e)
  display.remove(c2) 
  c2.isVisible=false
end
local function pum3 (e)
  display.remove(c3) 
  c3.isVisible=false
end
local function pum4 (e)
  display.remove(c4) 
  c4.isVisible=false
end
local function pum5 (e)
  display.remove(c5) 
  c5.isVisible=false
end
local function pum6 (e)
  display.remove(c6) 
  c6.isVisible=false
end
local function pum7 (e)
  display.remove(c7) 
  c7.isVisible=false
end
local function pum8 (e)
  display.remove(c8)
  c8.isVisible=false
end
local function pum9 (e)
  display.remove(c9) 
  c9.isVisible=false
end
local function pum10 (e)
  display.remove(c10) 
  c10.isVisible=false
end
local function pum11 (e)
  display.remove(c11) 
  c11.isVisible=false
end
local function pum12 (e)
  display.remove(c12) 
  c12.isVisible=false
end
local function pum13 (e)
  display.remove(c13)
  c13.isVisible=false
end
local function pum14 (e)
  display.remove(c14) 
  c14.isVisible=false
end
local function pum15 (e)
  display.remove(c15) 
  c15.isVisible=false
end
local function pum16 (e)
  display.remove(c16)
  c16.isVisible=false
end
local function pum17 (e)
  display.remove(c17)
  c17.isVisible=false
end
local function pum18 (e)
  display.remove(c18) 
  c18.isVisible=false
end
local function pum19 (e)
  display.remove(c19) 
  c19.isVisible=false
end
local function pum20 (e)
  display.remove(c20) 
  c20.isVisible=false
end
local function pum21 (e)
  display.remove(c21)
  c21.isVisible=false
end
local function pum22 (e)
  display.remove(c22) 
  c22.isVisible=false
end
local function pum23 (e)
  display.remove(c23)
  c23.isVisible=false
end
local function pum24 (e)
  display.remove(c24) 
  c24.isVisible=false
end
local function pum25 (e)
  display.remove(c25) 
  c25.isVisible=false
end
local function pum26 (e)
  display.remove(c26)
  c26.isVisible=false
end
local function pum27 (e)
  display.remove(c27) 
  c27.isVisible=false
end
local function pum28 (e)
  display.remove(c28) 
  c28.isVisible=false
end
local function pum29 (e)
  display.remove(c29) 
  c29.isVisible=false
end
local function pum30 (e)
  display.remove(c30) 
  c30.isVisible=false
end
c:addEventListener("collision", pum)
c1:addEventListener("collision", pum1)
c2:addEventListener("collision", pum2)
c3:addEventListener("collision", pum3)
c4:addEventListener("collision", pum4)
c5:addEventListener("collision", pum5)
c6:addEventListener("collision", pum6)
c7:addEventListener("collision", pum7)
c8:addEventListener("collision", pum8)
c9:addEventListener("collision", pum9)
c10:addEventListener("collision", pum10)
c11:addEventListener("collision", pum11)
c12:addEventListener("collision", pum12)
c13:addEventListener("collision", pum13)
c14:addEventListener("collision", pum14)
c15:addEventListener("collision", pum15)
c16:addEventListener("collision", pum16)
c17:addEventListener("collision", pum17)
c18:addEventListener("collision", pum18)
c19:addEventListener("collision", pum19)
c20:addEventListener("collision", pum20)
c21:addEventListener("collision", pum21)
c22:addEventListener("collision", pum22)
c23:addEventListener("collision", pum23)
c24:addEventListener("collision", pum24)
c25:addEventListener("collision", pum25)
c26:addEventListener("collision", pum26)
c27:addEventListener("collision", pum27)
c28:addEventListener("collision", pum28)
c29:addEventListener("collision", pum29)
c30:addEventListener("collision", pum30)
------
barra:addEventListener("touch", moverbarra)

timer.performWithDelay(math.random(2000,10000),crear,3)

fisica.addBody(li,'static')
fisica.addBody(ld,'static')
fisica.addBody(barra,"kinematic")
fisica.addBody(techo,"static")

fisica.addBody(c,  "kinematic")
fisica.addBody(c1, "kinematic")
fisica.addBody(c2, "kinematic")
fisica.addBody(c3, "kinematic")
fisica.addBody(c4, "kinematic")
fisica.addBody(c5, "kinematic")
fisica.addBody(c6, "kinematic")
fisica.addBody(c7, "kinematic")
fisica.addBody(c8, "kinematic")
fisica.addBody(c9, "kinematic")
fisica.addBody(c10,"kinematic")
fisica.addBody(c11,"kinematic")
fisica.addBody(c12,"kinematic")
fisica.addBody(c13,"kinematic")
fisica.addBody(c14,"kinematic")
fisica.addBody(c15,"kinematic")
fisica.addBody(c16,"kinematic")
fisica.addBody(c17,"kinematic")
fisica.addBody(c18,"kinematic")
fisica.addBody(c19,"kinematic")
fisica.addBody(c20,"kinematic")
fisica.addBody(c21,"kinematic")
fisica.addBody(c22,"kinematic")
fisica.addBody(c23,"kinematic")
fisica.addBody(c24,"kinematic")
fisica.addBody(c25,"kinematic")
fisica.addBody(c26,"kinematic")
fisica.addBody(c27,"kinematic")
fisica.addBody(c28,"kinematic")
fisica.addBody(c29,"kinematic")
fisica.addBody(c30,"kinematic")
