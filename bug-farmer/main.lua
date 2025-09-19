package.path = package.path .. ';../bugfarmer;../bugfarmer/menu;'
local mainMenu = require("menu.menu")

gameState = {}

gameState.currentScreen = "menu"

function love.load()
  world = love.physics.newWorld(0, 0, 0)
  mainMenu.initCanvas(800,600)
  mainMenu.drawMenu(world)
  gameCanvas = love.graphics.newCanvas(800, 600)
  local tileSheet = love.graphics.newImage("assets/tileSheet.png")
  local spriteBatch = love.graphics.newSpriteBatch(tileSheet, 1000)
  local quadBackGround = love.graphics.newQuad(0, 0, 32, 32, tileSheet:getDimensions())

  for baseY = 0, 600, 32 do
    for baseX = 0, 800, 32 do
      spriteBatch:add(quadBackGround, baseX, baseY)
    end
  end
  settingsCanvas = love.graphics.newCanvas(800, 600)
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