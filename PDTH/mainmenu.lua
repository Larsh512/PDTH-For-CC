local basalt = require("basalt") -- we need basalt here
local selectedplayer = "dallas"
local difficulty = "nrml"
local map = "fwb"
local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black}) -- we change the default bg and fg color for frames

local sub = { -- here we create a table where we gonna add some frames
    main:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"), -- obviously the first one should be shown on program start
    main:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"):hide(),
    main:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"):hide(),
}
local sub2 = {
    sub[2]:addFrame():setPosition(1,4), -- first should be shown when user clicks on settings
    sub[2]:addFrame():setPosition(1,4):hide(),
    sub[2]:addFrame():setPosition(1,4):hide(),
}

local function openSubFrame(id) -- we create a function which switches the frame for us
    if(sub[id]~=nil)then
        for k,v in pairs(sub)do
            v:hide()
        end
        sub[id]:show()
    end
end
local function openSettingFrame(id) -- we create a function which switches the frame for us
    if(sub2[id]~=nil)then
        for k,v in pairs(sub2)do
            v:hide()
        end
        sub2[id]:show()
    end
end

local menubar = main:addMenubar():setScrollable() -- we create a menubar in our main frame.
    :setSize("parent.w")
    :onChange(function(self, val)
        openSubFrame(self:getItemIndex()) -- here we open the sub frame based on the table index
    end)
    :addItem("Main")
    :addItem("Settings")
    :addItem("Credits")

-- Now we can change our sub frames, if you want to access a sub frame just use sub[subid].
local playbutton = sub[1]:addButton():setPosition(2, 2):setText("Play")
local diflabel = sub[1]:addLabel():setForeground(colors.black):setSize(16,1):setText("Difficulty (wip)"):setPosition(2,6)
local difDropdown = sub[1]:addDropdown():setPosition(2, 7):setSize(17,1)
local heislabel = sub[1]:addLabel():setForeground(colors.black):setSize(10,1):setText("Heister"):setPosition(2,14)
local heisterDropdown = sub[1]:addDropdown():setPosition(2, 15):setSize(17,1)
local maplabel = sub[1]:addLabel():setForeground(colors.black):setSize(13,1):setText("heists (wip)"):setPosition(2,22)
local mapDropdown = sub[1]:addDropdown():setPosition(2, 23):setSize(17,1)
-- Difficulties
difDropdown:addItem("Normal")
difDropdown:addItem("Hard")
difDropdown:addItem("Overkill")
difDropdown:addItem("Overkill145+")
-- Maps
mapDropdown:addItem("First World Bank")
mapDropdown:addItem("Heat Street")
mapDropdown:addItem("Panic Room")
mapDropdown:addItem("Green Bridge")
mapDropdown:addItem("Diamond Heist")
mapDropdown:addItem("Slaughterhouse")
mapDropdown:addItem("UnderCover")
mapDropdown:addItem("Counterfeit")
mapDropdown:addItem("No Mercy")
-- heisters
heisterDropdown:addItem("Dallas")
heisterDropdown:addItem("Chains")
heisterDropdown:addItem("Wolf")
heisterDropdown:addItem("Hoxton")

local quitbutton = sub[1]:addButton():setPosition("parent.w - 13", "parent.h - 4"):setText("Quit")
playbutton:onClick(function(self,event,button,x,y)
    if(event=="mouse_click")and(button==1)then
      basalt.stopUpdate()
      --print("PDTH/main.lua ".. selectedplayer.. " ".. difficulty) 
      shell.run("PDTH/main.lua ".. selectedplayer) 
    end
  end)
difDropdown:onChange(function(self, event, item)
    if item.text == "Normal" then
        difficulty = "nrml"
    elseif item.text == "Hard" then
        difficulty = "hrd"
    elseif item.text == "Overkill" then
        difficulty = "ovrkl"
    elseif item.text == "Overkill145+" then
        difficulty = "ovrkl145"
    else
        basalt.stopUpdate()
        print(item.text)
        error("weird unknown error involving NIL diff Value, Error code 2")
    end
  end)
  heisterDropdown:onChange(function(self, event, item)
    if item.text == "Hoxton" then
        selectedplayer = "hoxton"
    elseif item.text == "Wolf" then
        selectedplayer = "wolf"
    elseif item.text == "Chains" then
        selectedplayer = "chains"
    elseif item.text == "Dallas" then
        selectedplayer = "dallas"
    else
        basalt.stopUpdate()
        print(item.text)
        error("weird unknown error involving NIL heister Value, Error code 1")
    end
  end)
quitbutton:onClick(function(self,event,button,x,y)
  if(event=="mouse_click")and(button==1)then
     basalt.stopUpdate()
   end
end)

local menubar2 = sub[2]:addMenubar():setScrollable()
    :setSize("parent.w")
    :onChange(function(self, val)
        openSettingFrame(self:getItemIndex()) -- here we open the sub frame based on the table index
    end)
    :addItem("controls")
    :addItem("wip")
    :addItem("wip")
sub2[1]:addLabel():setText("Keybinds:"):setPosition(2, 2)
sub2[1]:addButton():setText("Not Implemented"):setPosition(2, 4):setSize(18, 3)

local function makeResizeable(frame, minW, minH, maxW, maxH) -- not currently used.
    minW = minW or 4
    minH = minH or 4
    maxW = maxW or 99
    maxH = maxH or 99
    local btn = frame:addButton()
        :ignoreOffset()
        :setPosition("parent.w", "parent.h")
        :setSize(1, 1)
        :setText("/")
        :setForeground(colors.black)
        :setBackground(colors.gray)
        :onDrag(function(self, _, _, xOffset, yOffset)
            local w, h = frame:getSize()
            local wOff, hOff = w, h
            if(w+xOffset-1>=minW)and(w+xOffset-1<=maxW)then
                wOff = w+xOffset-1
            end
            if(h+yOffset-1>=minH)and(h+yOffset-1<=maxH)then
                hOff = h+yOffset-1
            end
            frame:setSize(wOff, hOff)
        end)
end

sub[3]:addLabel():setForeground(colors.black):setSize("parent.w", "parent.h"):setText("Larsh512: Spritework/Coding/Menus, Overkill: The payday franchise itself all rights belong to them... This is just a fan project, Libraries used: OBSI2, Basalt, MoreFonts (early menu).")

basalt.autoUpdate()
