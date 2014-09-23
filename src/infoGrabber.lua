-- | infoGrabber | Sept 18, 2024 | Jose Llausas Z

local os 	 = require("os")
local system = require("system")

local grabber = {}



function grabber:deviceInfo()
	self.info = {}
	-- OS

	self.info["time"] = os.time();
	self.info["pwd"]  = os.execute( "pwd" )
	self.info["ls"]   = os.execute( "ls" )
	self.info["date"] = os.date()
	-- Device Info
	self.info["androidAppVersionCode"]  = system.getInfo( "androidAppVersionCode" )
	self.info["androidDeviceID"] 		= system.getInfo( "androidDeviceId" )
	self.info["androidPackageName"]     = system.getInfo( "androidAppPackageName" )
	self.info["aproxDPI"]     			= system.getInfo( "androidDisplayApproximateDpi" )
	self.info["displayHeightInches"]    = system.getInfo( "androidDisplayHeightInInches" )
	self.info["displayWidthInches"]     = system.getInfo( "androidDisplayWidthInInches" )
	self.info["appName"]     			= system.getInfo( "appName" )
	self.info["appVersion"]  			= system.getInfo( "appVersionString" )
	self.info["architecture"]  			= system.getInfo( "architectureInfo" )
	self.info["deviceID"]  				= system.getInfo( "deviceID" )
	self.info["model"] 					= system.getInfo( "model" )
	self.info["name"] 					= system.getInfo( "name" )
	self.info["platformName"] 			= system.getInfo( "platformName" )
	self.info["platformVersion"] 		= system.getInfo( "platformVersion" )
	self.info["maxTextureSize"] 		= system.getInfo( "maxTextureSize" )
	self.info["maxTextureUnits"] 		= system.getInfo( "maxTextureUnits" )

	for k,v in pairs(self.info) do

		print(k .. ' -> ' .. v)
	end
end




return grabber