--[[
 	App by jose@josellausas.com

	Created: --/--/--
]]

local storyboard = require("storyboard")
local ll 	     = require("src.llauColors")

-- This will setup the app with settings
local function setupApp(settings)
	display.setStatusBar( display.HiddenStatusBar )

	print(ll.blink .. ll.blue .. "Done setting up app" .. ll.off)
end

-- ****************
-- * Starts here: *
-- ****************
-- Sets up the app
setupApp(nil)
-- Goes to the first scene
storyboard.gotoScene("scenes.scene01", "fade", 100)
