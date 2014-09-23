-- Scene1 by jose@josellausas.com

local storyboard = require("storyboard")
---------------------------------------------------------------------------------
-- Scene01
---------------------------------------------------------------------------------
local scene = storyboard.newScene()

local debugText = nil

-- Our acceleration
local gravity = {}
gravity.x = 0
gravity.y = 0
gravity.z = 0

local instantGravity = {}
instantGravity.x = 0
instantGravity.y = 0
instantGravity.z = 0

local rawGravity = {}
rawGravity.x = 0
rawGravity.y = 0
rawGravity.z = 0


local reference_0 = nil

local function centerImage(img)
        img.anchorX = 0.5
        img.anchorY = 0.5
        img.x = display.contentCenterX
        img.y = display.contentCenterY
end

local function accelerometerUpdate(event)

        gravity.x = event.xGravity
        gravity.y = event.yGravity
        gravity.z = event.zGravity

        instantGravity.x, instantGravity.y, instantGravity.z = event.xInstant, event.yInstant, event.zInstant

        rawGravity.x, rawGravity.y, rawGravity.z = event.xRaw, event.yRaw, event.zRaw


        debugText.text = "Gravity: " .. instantGravity.x .. " , " .. instantGravity.y  .. " , " .. instantGravity.z

end

local function onUpdate( event )
        
        reference_10.x = display.contentCenterX + (gravity.y * 200)
        reference_10.y = display.contentCenterY + (gravity.x * 200)

end

local function createDebugTexts()
        debugText = display.newText( "Hello World!", 100, 200, native.systemFont, 20 )
        debugText.anchorX = 0
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
        local group = self.view

        system.setAccelerometerInterval( 100 ) -- 100 hz is max

        reference_10 = display.newImage("res/bg.jpg")
        reference_0 = display.newImage( "res/test.png" )

        createDebugTexts()



end

-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
        local group = self.view

        reference_0.xScale = 0.5
        reference_0.yScale = 0.5

        centerImage(reference_0)
        centerImage(reference_10)

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local group = self.view

        print("Entered Scene")

        Runtime:addEventListener( "accelerometer" , accelerometerUpdate) 
        Runtime:addEventListener( "enterFrame"        , onUpdate )   



end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
        local group = self.view

end

-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
        local group = self.view

end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
        local group = self.view

end

-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
        local group = self.view
        local overlay_name = event.sceneName  -- name of the overlay scene

end


-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
        local group = self.view
        local overlay_name = event.sceneName  -- name of the overlay scene

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )

-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )

---------------------------------------------------------------------------------

return scene