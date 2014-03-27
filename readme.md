CoronaBaseApp
=============
## About
A template for a new Corona App
providing basic file and code structure as well as helper functions to enable rapid development.

##Project Structure
- (root directory)
    - main.lua 
    - config.lua 
    - build.settings 
    - readme.md 
    - Scenes/
        - Scene01.lua
    - src/
        - llauColors.lua
        - helpers.lua

##main.lua
An entry point for our app. Sets up some common variables and device settings. Calls the storyboard's first scene.

##scene01.lua
Provides a template for a *Storyboard Scene* with the following event listeners:

- createScene()
- willEnterScene()
- enterScene()
- exitScene()
- didExitScene()
- destroyScene()
- overlayBegan()
- overlayEnded()

##helpers.lua
Provides helper functions for Rapid App Development.


