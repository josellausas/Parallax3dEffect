--[[-----------------------------
	helpers.lua
---------------------------------
 Author: 	Jose Llausas
 Email: 	jose@zunware.com
 Created: 	May 2, 2013
 Purpose: 	Helper Functions
 ]]


-- Modules:
local math 			= require("math")
local storyboard 	= require("storyboard")
local llau 			= require("llauColors")

-- This Module's object:
local t = {}

------------------------- writeFile() ------------------------------
-- in: 		filepath : the filepath to write to
--			data 	 : the Data to write
-- out: 	None
-- Purpose:	Opens a file and writes to it
t.writeFile = function(filepath, data)
	local path = system.pathForFile(filepath, system.DocumentsDirectory)
	local file = io.open(path, "w")
	file:write(data)
	io.close(file)
	file = nil
end

function string:split( inSplitPattern, outResults )
   if not outResults then
      outResults = { }
   end
   local theStart = 1
   local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
   while theSplitStart do
      table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
      theStart = theSplitEnd + 1
      theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
   end
   table.insert( outResults, string.sub( self, theStart ) )
   return outResults
end

------------------------- readFile() ------------------------------
-- in: 		filepath 	: the file to read
-- out: 	inputData 	: the contents of the file
-- Purpose:	Opens and reads from a file
t.readFile = function(filepath)
	local path = system.pathForFile(filepath, system.DocumentsDirectory)
	local file = io.open(path, "r")
	local inputData = file:read("*a")
	io.close(file)
	return inputData
end

------------------------- fileExists() ------------------------------
-- in: 		filename 	: the file to read
-- out: 	true 		: the file exists
--			false       : the file does not exist
-- Purpose:	verifies the existance of a file
t.fileExists = function(filename)
	local path = system.pathForFile(filename, system.DocumentsDirectory)
	local f=io.open(path,"r")
	if f~=nil then io.close(f) return true else return false end
end

------------------------- getDistance() ------------------------------
-- in: 		objA 		: an obj with x and y coords
--			objB		: an obj with x and y coords
-- out: 	dist 		: the distance between objA and objB
-- Purpose:	Returns the linear distance between two objects
t.getDistance = function(objA, objB)
	local dX = objB.x - objA.x;
	local dY = objB.y - objA.y;
	local distSq = (dX ^ 2) + (dY ^ 2);

	return math.sqrt(distSq);
end

------------------------- saveGame() ------------------------------
-- in: 		playername
-- out: 	None
-- Purpose:	Saves the game state to be loaded later
t.saveGame = function(playername)
	t.writeFile(playername, "NombreDeWey");
end

t.testScores = {}

t.testScores.name = 
{
	"Player01",
	"Player02",
	"Player03",
	"Player04",
	"Player05",
}

t.testScores.score = 
{
	"60",
	"70",
	"80",
	"90",
	"100",
}

t.saveHighScores = function(highScoresDict)

	local hs = highScoresDict

	local path = system.pathForFile("hs.txt", system.DocumentsDirectory)
	local file = io.open(path, "w")

	for i=1, #hs.name do
		print(hs.name[i])
		print(hs.score[i])
		local string = hs.name[i] .. ";" .. hs.score[i] .. ";"
		file:write(string)
		print(i)
	end


	io.close( file )
end

t.readHighScores = function()
	local path = system.pathForFile("hs.txt", system.DocumentsDirectory)
	local file = io.open(path, "r")
	local inputData = file:read("*a")
	io.close(file)

	local table = inputData:split(";")
	print("This has " .. #table)

	for i=1,#table do
		print(table[i])
	end

	-- for i=1,#table -1,2 do
	-- 	local stringu = table[i] .. " has " .. table[i+1]
	-- 	print(stringu)
	-- end
	return table
end

------------------------- centerX() ------------------------------
-- in: 		an image
-- out: 	None
-- Purpose:	Centers the images position on the x axis
t.centerX = function(image)
	--local center = display.contentWidth * 0.5;
	--local offset = image.width * 0.5;

	image.x = (display.contentWidth - image.width) * 0.5;
	
	print("centered image.x = " .. image.x)
end

------------------------- centerY() ------------------------------
-- in: 		an image
-- out: 	None
-- Purpose:	Centers the images position on the y axis
t.centerY = function(image)
	image.y = (display.contentHeight - image.height) * 0.5
	print("centered image.y = " .. image.y)
end

------------------------- centerImage() ------------------------------
-- in: 		an image
-- out: 	None
-- Purpose:	Centers the images position on the x and y axis
t.centerImage = function(image)
	t.centerX(image)
	t.centerY(image)
end
------------------------- loadGame() ------------------------------
-- in: 		playername
-- out: 	None
-- Purpose:	Loads the game state 
t.loadGame = function(playername)
	print("loaded game")
	data = t.readFile(playername)

	print("data loaded: " .. data)
	-- Load the data onto the storyboard.
	storyboard.playerProfile.name = data;
end

-- Returns true if device is an Android
t.isAndroid = function()
	return ("Android" == system.getInfo("platformName"))
end

-- Returns true if device is a Simulator
t.isSimulator = function()
	return ("simulator" == system.getInfo("enviroment"))
end

t.fade = function(image, time)
	image.alpha = 0;

	-- fade in
	transition.to(image, {time=time, delay=10, alpha=1})
	-- fade out
	transition.to(image, {time=time, delay=time+10, alpha=0})
end

t.centerBackground = function(background)
	background.anchorX = 0.5
	background.anchorY = 0.5
	--background:setReferencePoint(display.CenterReferencePoint)
	background.x = display.contentWidth * 0.5
	background.y = display.contentHeight * 0.5
	print("Background's position = " .. background:localToContent(0,0))
end

-----------------------------getSaveGamePath()----------------------------
-- Returns: a path to the savefile.
t.getSaveGamePath = function()
	return system.pathForFile("saveGame.txt", system.DocumentsDirectory)
end


-- Return the module:
return t
