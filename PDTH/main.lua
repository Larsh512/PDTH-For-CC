-- TODO:
-- Make Movement not be absolute crap.
-- Make Level system,
-- Make a damn money system,
-- Make actuall police assault

-- Current done:
-- player sprites {&}









local obsi = require("obsi2")
local player
-- local bot -- Unused
local x,y = 1,1
local w, h
local policeassaultind
local policeassault = true
print("Select between hoxton, dallas, chains, or wolf. all spelt lowercase. Iff you dont choose you will play as hoxton.")
playercharoption = read()
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
 -- END OFF KEYBINDS
 local playerpixel = 1
 	if playerrotation == "right" then -- Iff player facin right
		
 		if forward == true then
			x = x + playerpixel
 		end
		 if backward == true then
			x = x - playerpixel
		 end
 		if left == true then
		y = y + playerpixel
 		end
 		if right == true then
			y = y - playerpixel
 		end
	elseif playerrotation == "left" then
		if forward == true then
			x = x - playerpixel
 		end
		 if backward == true then
			x = x + playerpixel
		 end
 		if left == true then
		y = y - playerpixel
 		end
 		if right == true then
			y = y + playerpixel
 		end
	elseif playerrotation == "forward" then
		if forward == true then
			y = y + playerpixel
		end
		if backward == true then
			y = y - playerpixel
		end
		if left == true then
			x = x + playerpixel
 		end
		 if right == true then
			x = x - playerpixel
		end
	elseif playerrotation == "backward" then
		if forward == true then
			y = y - playerpixel
		end
		if backward == true then
			y = y + playerpixel
		end
		if left == true then
			x = x - playerpixel
 		end
		 if right == true then
			x = x + playerpixel
		end
 	end
 if turnleft == true then
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

obsi.init()
term.setTextColor(colors.green)
print("Thanks for playin!")
