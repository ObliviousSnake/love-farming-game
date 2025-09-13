local mainMenu = require("bug-farmer.menu.menu")

function love.load()
  mainMenu.initCanvas(800,600)
  mainMenu.drawMenu()
  print(mainMenu)
end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(mainMenu.canvas)
end