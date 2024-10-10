local nbsTunes = require("nbsTunes")

-- To use custom instruments, you need to map the filename in the .nbs file to a Minecraft sound id
-- The example with custom instruments has an exploding creeper sound
-- nbsTunes.setCustomInstrument("explode1.ogg", "entity.generic.explode")
-- local music = nbsTunes.load("custom_instruments.nbs")

-- Load Doritos and Fritos, 100 gecs (converted to .nbs by Michiel)

-- Show the parsed metadata
print("Playing music.")
assault = true
stealth = false
while true do
-- Play the music
if stealth == true then
        local music = nbsTunes.load("/PDTH/gunmetalgraycover.nbs")
        for i = 0, 3 do
        music:play()
        print("Did a loop.")
        end  
        stealth = false
        assault = true

elseif assault == true then
        local music2 = nbsTunes.load("/PDTH/codesilvercontroll.nbs")
        for i = 0, 3 do
        music2:play()
         print("Did a loop.")
      end
      local music3 = nbsTunes.load("/PDTH/codesilveranticipation.nbs")
     for i = 0, 1 do
         music3:play()
         print("Did a loop.")
      end
     local music4 = nbsTunes.load("/PDTH/codesilverassault.nbs")
     for i = 0, 3 do
         music4:play()
         print("Did a loop.")
     end
end
end