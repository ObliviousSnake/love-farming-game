package.path = package.path .. ';../bugfarmer;../bugfarmer/menu;'
local mainMenu = require("menu.menu")

gameState = {}

gameState.currentScreen = "menu"

function love.load()
  world = love.physics.newWorld(0, 0, 0)
  mainMenu.initCanvas(800,600)
  mainMenu.drawMenu(world)
end

function love.update(dt)
  mainMenu.updateMenuState(dt)
end

function love.draw()
  love.graphics.draw(mainMenu.canvas)
end