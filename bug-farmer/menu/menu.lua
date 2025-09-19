local mainMenu = {}
mainMenu.objects = {}
mainMenu.state = {}

mainMenu.state.mouseDown = false
mainMenu.state.mouseUp = true
mainMenu.state.pressPlay = false
mainMenu.state.pressSettings = false

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
  playButton.x = mainMenu.dimX * .21875
  playButton.y = mainMenu.dimY * .791667
  playButton.height = 100
  playButton.width = 150
  playButton.body = love.physics.newBody(world, playButton.x, playButton.y)
  playButton.shape = love.physics.newRectangleShape(150, 100)
  playButton.fixture = love.physics.newFixture(playButton.body, playButton.shape, 1)
  mainMenu.objects.playButton = playButton
  love.graphics.draw(playButton.image, playButton.x, playButton.y, 0, 1, 1, playButton.width / 2, playButton.height / 2)

  mainMenu.objects.menuButton = {}
  local menuButton = mainMenu.objects.menuButton
  menuButton.image = love.graphics.newImage("menu/assets/menuButton.png")
  menuButton.x = mainMenu.dimX * .5
  menuButton.y = mainMenu.dimY * .791667
  menuButton.height = 100
  menuButton.width = 150
  menuButton.body = love.physics.newBody(world, menuButton.x, menuButton.y)
  menuButton.shape = love.physics.newRectangleShape(150, 100)
  menuButton.fixture = love.physics.newFixture(menuButton.body, menuButton.shape, 1)
  mainMenu.objects.menuButton = menuButton
  love.graphics.draw(menuButton.image, menuButton.x, menuButton.y, 0, 1, 1, menuButton.width / 2, menuButton.height / 2)

  mainMenu.objects.exitButton = {}
  local exitButton = mainMenu.objects.exitButton
  exitButton.image = love.graphics.newImage("menu/assets/exitButton.png")
  exitButton.x = mainMenu.dimX * .78125
  exitButton.y = mainMenu.dimY * .791667
  exitButton.height = 100
  exitButton.width = 150
  exitButton.body = love.physics.newBody(world, exitButton.x, exitButton.y)
  exitButton.shape = love.physics.newRectangleShape(exitButton.width, exitButton.height)
  exitButton.fixture = love.physics.newFixture(exitButton.body, exitButton.shape, 1)
  mainMenu.objects.exitButton = exitButton
  love.graphics.draw(exitButton.image, exitButton.x, exitButton.y, 0, 1, 1, exitButton.width / 2, exitButton.height / 2)

  love.graphics.setCanvas()
end

function mainMenu.updateMenuState(dt) 
  -- if mouse is up, allow mouseDown
  mainMenu.state.mouseDown = love.mouse.isDown(1)
  if mainMenu.state.mouseDown and mainMenu.state.mouseUp then
    handleUpdate()
  end
  mainMenu.state.mouseUp = not love.mouse.isDown(1)
end

function handleUpdate()
  local cursorX, cursorY = love.mouse.getPosition()

  -- check each box
  if mainMenu.objects.exitButton.fixture:testPoint(cursorX, cursorY) then
    love.event.quit()
  end

  if mainMenu.objects.playButton.fixture:testPoint(cursorX, cursorY) then
    -- how do i manage screen switch? global variable from here?
    mainMenu.state.pressPlay = true
    return
  end

  if mainMenu.objects.menuButton.fixture:testPoint(cursorX, cursorY) then
    mainMenu.state.pressSettings = true
    return
  end
end

return mainMenu