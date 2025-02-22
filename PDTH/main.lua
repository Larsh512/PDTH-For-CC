local sprites = {
  hoxton = {
    right = obsi.graphics.newImage("hoxton.nfp"),
    left = obsi.graphics.newImage("hoxtonleft.nfp"),
    forward = obsi.graphics.newImage("hoxtonfor.nfp"),
    backward = obsi.graphics.newImage("hoxtonback.nfp")
  },
  dallas = {
    right = obsi.graphics.newImage("dallas.nfp"),
    left = obsi.graphics.newImage("dallasleft.nfp"),
    forward = obsi.graphics.newImage("dallasfor.nfp"),
    backward = obsi.graphics.newImage("dallasback.nfp") 
  },
  wolf = {  -- Corrected capitalization
    right = obsi.graphics.newImage("wolf.nfp"),
    left = obsi.graphics.newImage("wolfleft.nfp"),
    forward = obsi.graphics.newImage("wolffor.nfp"),
    backward = obsi.graphics.newImage("wolfback.nfp")
  },
  chains = {
    right = obsi.graphics.newImage("chains.nfp"),
    left = obsi.graphics.newImage("chainsleft.nfp"),
    forward = obsi.graphics.newImage("chainsfor.nfp"),
    backward = obsi.graphics.newImage("chainsback.nfp")
  }, 
}

local tArgs = {...}
local obsi = require("obsi2")

-- Initialize player sprite (default to hoxton right)
local playercharoption = tArgs[1] or "hoxton"  -- Default to "hoxton" if no argument
local playerrotation = "right"
local playersprite = sprites[playercharoption][playerrotation]  -- Use the table immediately

-- Player state (encapsulated)
local gameState = {
  x = 1,
  y = 1,
  speed = 32  -- Use a named constant
}

local w, h
local policeassaultind
local policeassault = true

function obsi.load()
  -- No need for the if/elseif block here anymore
  policeassaultind = obsi.graphics.newImage("Policeassault.nfp")
end

function obsi.update(dt)  -- Get delta time (dt) as an argument
  w, h = obsi.graphics.getPixelSize()

  -- KEYBINDS (Simplified)
  local forward = obsi.keyboard.isDown("e")
  local backward = obsi.keyboard.isDown("d")
  local left = obsi.keyboard.isDown("s")
  local right = obsi.keyboard.isDown("f")
  local turnleft = obsi.keyboard.isDown("left")
  local turnright = obsi.keyboard.isDown("right")
  local quittotitle = obsi.keyboard.isDown("n")

  -- Movement (Using gameState and dt)
  local vel = gameState.speed * dt  -- Calculate velocity based on dt

  if playerrotation == "right" then
    if forward then gameState.x = gameState.x + vel end
    if backward then gameState.x = gameState.x - vel end
    if left then gameState.y = gameState.y + vel end
    if right then gameState.y = gameState.y - vel end
  elseif playerrotation == "left" then
    if forward then gameState.x = gameState.x - vel end
    if backward then gameState.x = gameState.x + vel end
    if left then gameState.y = gameState.y - vel end
    if right then gameState.y = gameState.y + vel end
  elseif playerrotation == "forward" then
    if forward then gameState.y = gameState.y + vel end
    if backward then gameState.y = gameState.y - vel end
    if left then gameState.x = gameState.x + vel end
    if right then gameState.x = gameState.x - vel end
  elseif playerrotation == "backward" then
    if forward then gameState.y = gameState.y - vel end
    if backward then gameState.y = gameState.y + vel end
    if left then gameState.x = gameState.x - vel end
    if right then gameState.x = gameState.x + vel end
  end

  -- Rotation (Simplified)
  if turnleft then
    playerrotation = {right="forward", forward="left", left="backward", backward="right"}[playerrotation]
    playersprite = sprites[playercharoption][playerrotation] -- Update the sprite
    sleep(0.3)  -- Consider using a timer instead of sleep
  end
  if turnright then
    playerrotation = {right="backward", forward="right", left="forward", backward="left"}[playerrotation]
    playersprite = sprites[playercharoption][playerrotation] -- Update the sprite
    sleep(0.3) -- Consider using a timer instead of sleep
  end

  -- Quit to Title (Placeholder)
  if quittotitle then
    -- Do nothing for now...
  end
end

function obsi.draw()
  obsi.graphics.setForegroundColor(colors.green)
  obsi.graphics.rectangle("fill", 0,  0, w, h)
  obsi.graphics.draw(playersprite, gameState.x, gameState.y)  -- Draw the correct sprite
  if policeassault then
    local paw, pah = w/2, h - 15
    obsi.graphics.draw(policeassaultind, paw, pah)
  end
end

function obsi.onQuit()
  -- shell.run("PDTH/mainmenu.lua")  -- Fix if needed
end

obsi.init()
