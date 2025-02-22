-- TODO:
-- Make Movement not be absolute crap.
-- Make Level system,
-- Make a damn money system,
-- Make actuall police assault

-- Current done:
-- player sprites {&}








local tArgs = {...}
local obsi = require("obsi2")
local player
-- local bot -- Unused
local playerx, playery = 1,1
local w, h
local policeassaultind
local policeassault = true
vel = 32
playercharoption = tArgs[1]
playerrotation = "right"
function obsi.load()
	if playercharoption == "hoxton" then -- the funni british man who swears
	player = obsi.graphics.newImage("hoxton.nfp") 
	elseif playercharoption == "dallas" then -- The one dude who's brother is autistic or something... Idk
			player = obsi.graphics.newImage("dallas.nfp")
	elseif playercharoption == "wolf" then -- wolf, One off my two favorites, Funni psychopath gamedev go weeeee
		player = obsi.graphics.newImage("wolf.nfp")
	elseif playercharoption == "chains" then -- Black dude, Thats it really... he's black... he has a gun... And... Yeah.
		player = obsi.graphics.newImage("chains.nfp")
	else -- incase the player doesnt choose, Just make them my boi hox.
		playercharoption = "hoxton"
		player = obsi.graphics.newImage("hoxton.nfp")
	end
	policeassaultind = obsi.graphics.newImage("Policeassault.nfp") -- Police assault indicator.
end

function obsi.update()
 w, h = obsi.graphics.getPixelSize()
 -- KEYBINDS
 forward = obsi.keyboard.isDown("e") -- Forward
 backward = obsi.keyboard.isDown("d") -- Backward
 left = obsi.keyboard.isDown("s") -- Left
 right = obsi.keyboard.isDown("f") -- Right
 turnleft = obsi.keyboard.isDown("left") -- Left turn
 turnright = obsi.keyboard.isDown("right")  -- Right turn
 quittotitle = obsi.keyboard.isDown("n") -- Quit to Title
 -- END OFF KEYBINDS
 	if playerrotation == "right" then -- If player facin right
		
 		if forward == true then
			playerx = playerx + vel * dt
 		end
		 if backward == true then
			playerx = playerx - vel * dt
		 end
 		if left == true then
		       playery = playery + vel * dt
 		end
 		if right == true then
			playery = playery - vel * dt
 		end
	elseif playerrotation == "left" then -- if he's facing left. 
		if forward == true then
			playerx = playerx - vel * dt
 		end
		 if backward == true then
		        playerx = playerx + vel * dt
		 end
 		if left == true then
		        playery = playery - vel * dt
 		end
 		if right == true then
			playery = playery + vel * dt
 		end
	elseif playerrotation == "forward" then -- if facing forward
		if forward == true then
			playery = playery + vel * dt
		end
		if backward == true then
			playery = playery - vel * dt
		end
		if left == true then
			playerx = playerx + vel * dt
 		end
		 if right == true then
			playerx = playerx - vel * dt
		end
	elseif playerrotation == "backward" then -- if facing backwards. 
		if forward == true then
			playery = playery - vel * dt
		end
		if backward == true then
			playery = playery + vel * dt
		end
		if left == true then
			playerx = playerx - vel * dt
 		end
		 if right == true then
			playerx = playerx + vel * dt
		end
 	end
 if turnleft == true then -- this sucks, But I'll deal with it l8r, Because I'm not dealing with this crap at 2 am.
	if playerrotation == "right" then
		playerrotation = "forward"
	elseif playerrotation == "forward" then
		playerrotation = "left"
	elseif playerrotation == "left" then
		playerrotation = "backward"
	elseif playerrotation == "backward" then
		playerrotation = "right"
	end
	sleep(0.3)
 end
 if turnright == true then
	if playerrotation == "right" then
		playerrotation = "backward"
	elseif playerrotation == "forward" then
		playerrotation = "right"
	elseif playerrotation == "left" then
		playerrotation = "forward"
	elseif playerrotation == "backward" then
		playerrotation = "left"
	end
	sleep(0.3)
 end
 if quittotitle == true then
 -- do nothing for now... Because its broken. For reasons, Bcuz obsi2 does not like basalt.
end
 	if playercharoption == "dallas" then
		if playerrotation == "right" then
			player = obsi.graphics.newImage("dallas.nfp")
		elseif playerrotation == "left" then
			player = obsi.graphics.newImage("dallasleft.nfp")
		elseif playerrotation == "forward" then
			player = obsi.graphics.newImage("dallasfor.nfp")
		elseif playerrotation == "backward" then
		player = obsi.graphics.newImage("dallasback.nfp")
		end
	end
	if playercharoption == "wolf" then
		if playerrotation == "right" then
			player = obsi.graphics.newImage("wolf.nfp")
		elseif playerrotation == "left" then
			player = obsi.graphics.newImage("wolfleft.nfp")
		elseif playerrotation == "forward" then
			player = obsi.graphics.newImage("wolffor.nfp")
		elseif playerrotation == "backward" then
		player = obsi.graphics.newImage("wolfback.nfp")
		end
	end
	if playercharoption == "hoxton" then
		if playerrotation == "right" then
			player = obsi.graphics.newImage("hoxton.nfp")
		elseif playerrotation == "left" then
			player = obsi.graphics.newImage("hoxtonleft.nfp")
		elseif playerrotation == "forward" then
			player = obsi.graphics.newImage("hoxtonfor.nfp")
		elseif playerrotation == "backward" then
			player = obsi.graphics.newImage("hoxtonback.nfp")
		end
	end
	if playercharoption == "chains" then
		if playerrotation == "right" then
			player = obsi.graphics.newImage("chains.nfp")
		elseif playerrotation == "left" then
			player = obsi.graphics.newImage("chainsleft.nfp")
		elseif playerrotation == "forward" then
			player = obsi.graphics.newImage("chainsfor.nfp")
		elseif playerrotation == "backward" then
			player = obsi.graphics.newImage("chainsback.nfp")
		end
	end
end

function obsi.draw()
	obsi.graphics.setForegroundColor(colors.green)
	obsi.graphics.rectangle("fill", 0,  0, w, h)
	obsi.graphics.draw(player, x, y)
	if policeassault == true then
		paw,pah = w/2, h - 15
		obsi.graphics.draw(policeassaultind,paw,pah)
	end
end
function obsi.onQuit()
	--shell.run("PDTH/mainmenu.lua")
	-- NOT USED CURRENTLY DUE TO ISSUES.
end

obsi.init()
