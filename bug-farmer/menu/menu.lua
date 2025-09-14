local mainMenu = {}
mainMenu.objects = {}
--@param dimX number dimension width
--@param dimY number dimension height
--@return creates a new canvas
--@error dimensions invalid
function mainMenu.initCanvas(dimX, dimY) 
  if dimX <= 0 and dimY <= 0 then
    error({msg = "dimensions invalid"})
    return
  end
  mainMenu.dimX = dimX
  mainMenu.dimY = dimY
  mainMenu.canvas = love.graphics.newCanvas(dimX, dimY)
end

-- @param world World
function mainMenu.drawMenu(world)
  love.graphics.setCanvas(mainMenu.canvas)
  local title = love.graphics.newImage("menu/assets/title.png")
  local r, g, b = love.math.colorFromBytes(43, 220, 255)
  love.graphics.setBackgroundColor(r, g, b)
  love.graphics.draw(title, mainMenu.dimX * .1875, mainMenu.dimY * .0625)
  
  mainMenu.objects.playButton = {}
  local playButton = mainMenu.objects.playButton
  playButton.image = love.graphics.newImage("menu/assets/playButton.png")
  playButton.x = mainMenu.dimX * .125
  playButton.y = mainMenu.dimY * .7083
  playButton.body = love.physics.newBody(world, playButton.x, playButton.y)
  playButton.shape = love.physics.newRectangleShape(150, 100)
  playButton.fixture = love.physics.newFixture(playButton.body, playButton.shape, 1)
  love.graphics.draw(playButton.image, playButton.x, playButton.y)

  mainMenu.objects.menuButton = {}
  local menuButton = mainMenu.objects.menuButton
  menuButton.image = love.graphics.newImage("menu/assets/menuButton.png")
  menuButton.x = mainMenu.dimX * .40625
  menuButton.y = mainMenu.dimY * .7083
  menuButton.body = love.physics.newBody(world, menuButton.x, menuButton.y)
  menuButton.shape = love.physics.newRectangleShape(150, 100)
  menuButton.fixture = love.physics.newFixture(menuButton.body, menuButton.shape, 1)
  love.graphics.draw(menuButton.image, menuButton.x, menuButton.y)

  mainMenu.objects.exitButton = {}
  local exitButton = mainMenu.objects.exitButton
  exitButton.image = love.graphics.newImage("menu/assets/exitButton.png")
  exitButton.x = mainMenu.dimX * .6875
  exitButton.y = mainMenu.dimY * .7083
  exitButton.body = love.physics.newBody(world, exitButton.x, exitButton.y)
  exitButton.shape = love.physics.newRectangleShape(150, 100)
  exitButton.fixture = love.physics.newFixture(exitButton.body, exitButton.shape, 1)
  love.graphics.draw(exitButton.image, exitButton.x, exitButton.y)

  love.graphics.setCanvas()
end

return mainMenu