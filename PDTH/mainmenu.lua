os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end

local nOption = 1

local function drawMenu()
   term.clear()
   term.setCursorPos(1,1)
   term.write("CC:TH Indev Build 0.1 // ")
term.setCursorPos(1,2)

   term.setCursorPos(w-11,1)
   if nOption == 1 then
   term.write("PLAY")
elseif nOption == 2 then
   term.write("wip")
elseif nOption == 3 then
   term.write("QUIT")
else
end

end

--GUI
term.clear()
local function drawFrontend()
   printCentered( math.floor(h/2) - 3, "")
   printCentered( math.floor(h/2) - 2, "CC:The Heist." )
   printCentered( math.floor(h/2) - 1, "")
   printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ PLAY        ]") or "  PLAY         " )
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ UNAVAILABLE ]") or "  UNAVAILABLE  " )
   printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ QUIT        ]") or "  QUIT         " )
   printCentered( math.floor(h/2) + 3, "")
end

--Display
drawMenu()
drawFrontend()

while true do
 local e,p = os.pullEvent()
 if e == "key" then
  local key = p
  if key == 17 or key == 200 then

   if nOption > 1 then
    nOption = nOption - 1
    drawMenu()
    drawFrontend()
   end
  elseif key == 31 or key == 208 then
  if nOption < 3 then
  nOption = nOption + 1
  drawMenu()
  drawFrontend()
end
elseif key == 28 then
    --End should not be here!!
break
end --End should be here!!
end
end
term.clear()

--Conditions
if nOption  == 1 then
    shell.run("clear")
    shell.run("/PDTH/main.lua")
elseif nOption == 2 then
    shell.run("/PDTH/mainmenu.lua")
elseif nOption == 3 then
    shell.run("clear")
    print("Thanks for playin!")
else
    -- nothin
end
