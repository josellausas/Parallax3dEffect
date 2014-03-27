-- Config File by Jose Llausas
-- Marzo 20, 2013 
application =
{
	-- dissable analytics for now:
	launchpad = false,
	
	content =
	{	
		width = 768,
		height = 1136,

		fps = 30,
		-- fps = 60,
		
		--scale values: none, letterbox, zoomEven, zoomStretch
		scale = "zoomEven",
		xAlign = "center",
		yAlign = "center",
		
		--for HD/Retina phones, multiple Image selection FTW:
		imageSuffix = 
		{
			--iPhone4/ iPod4 / iPad1 / iPad2 / KindleFire HD 7 / Galaxy S3
			["@2x"] = 0.8,
			--Retina iPad, Kindle Fire HD 9, Nexus 10
			["@4x"] = 1.5,
			--Example filename:
			--MyImage.png, myImage@2x.png
		}
	}
}