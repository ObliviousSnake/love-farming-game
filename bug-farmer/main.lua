local mainMenu = require("bug-farmer.menu.menu")

function love.load()
  world = love.physics.newWorld(0, 0, 0)
  mainMenu.initCanvas(800,600)
  mainMenu.drawMenu(world)
  print(mainMenu)
end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(mainMenu.canvas)
end