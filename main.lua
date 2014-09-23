--[[
 	App by jose@josellausas.com

	Created: 18/Sept/2014
]]

local storyboard = require("storyboard")
local ll 	     = require("src.llauColors")
local setup 	 = require("src.setup")
local grabber    = require("src.infoGrabber")

-- ****************
-- * Starts here: *
-- ****************

-- Sets up the app
setup.setupApp(nil)

print(ll.blink .. ll.blue .. "Done setting up app" .. ll.off)

-- Print some info here
grabber:deviceInfo()

-- Goes to the first scene
storyboard.gotoScene("scenes.scene01", "fade", 100)
