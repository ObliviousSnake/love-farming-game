package.path = package.path .. ';../bugfarmer;../bugfarmer/menu;'
local mainMenu = require("menu.menu")

gameState = {}

gameState.currentScreen = "menu"
gameState.screenSettings = {}
gameState.screenSettings.dimX = 1280
gameState.screenSettings.dimY = 720

function love.load()
  world = love.physics.newWorld(0, 0, 0)
  local screenSize = gameState.screenSettings
  love.window.setMode(screenSize.dimX, screenSize.dimY)
  mainMenu.initCanvas(screenSize.dimX, screenSize.dimY)
  mainMenu.drawMenu(world)
  gameCanvas = love.graphics.newCanvas(screenSize.dimX, screenSize.dimY)
  local tileSheet = love.graphics.newImage("assets/tileSheet.png")
  local spriteBatch = love.graphics.newSpriteBatch(tileSheet, 1000)
  local quadBackGroundFlower = love.graphics.newQuad(0, 0, 32, 32, tileSheet:getDimensions())
  local quadBackGroundGrass = love.graphics.newQuad(32, 0, 64, 32, tileSheet:getDimensions())
  local quadBackGroundSparse = love.graphics.newQuad(64, 0, 96, 32, tileSheet:getDimensions())

  local quadTopLeftField = love.graphics.newQuad(0, 64, 32, 96, tileSheet:getDimensions())
  local quadMiddleLeftField = love.graphics.newQuad(0, 96, 32, 128, tileSheet:getDimensions())
  local quadBottomLeftField = love.graphics.newQuad(0, 128, 32, 160, tileSheet:getDimensions())

  local quadTopMiddleField = love.graphics.newQuad(32, 64, 64, 96, tileSheet:getDimensions())
  local quadMiddleField = love.graphics.newQuad(32, 96, 64, 128, tileSheet:getDimensions())
  local quadBottomMiddleField = love.graphics.newQuad(32, 128, 64, 160, tileSheet:getDimensions())

  local quadTopRightField = love.graphics.newQuad(64, 64, 96, 96, tileSheet:getDimensions())
  local quadMiddleRightField = love.graphics.newQuad(64, 96, 96, 128, tileSheet:getDimensions())
  local quadBottomRightField = love.graphics.newQuad(64, 128, 96, 160, tileSheet:getDimensions())

  for baseY = 0, screenSize.dimY, 32 do
    for baseX = 0, screenSize.dimX, 32 do
      local random = love.math.random()
      if random < .33 then
        spriteBatch:add(quadBackGroundFlower, baseX, baseY)
      elseif random < .67 then
        spriteBatch:add(quadBackGroundGrass, baseX, baseY)
      else
        spriteBatch:add(quadBackGroundSparse, baseX, baseY)
      end
      
    end
  end
  settingsCanvas = love.graphics.newCanvas(screenSize.dimX, screenSize.dimY)
  drawScreen = {
    ["menu"] = function()
      mainMenu.drawCanvas()
    end,
    ["game"] = function()
      love.graphics.draw(spriteBatch)
    end,
    ["settings"] = function()
      love.graphics.draw(settingsCanvas)
    end

  }
end

function love.update(dt)
  mainMenu.updateMenuState(dt, gameState)
end

function love.draw()
  local screenToDraw = drawScreen[gameState.currentScreen]
  screenToDraw()
end