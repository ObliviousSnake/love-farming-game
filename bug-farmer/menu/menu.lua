local mainMenu = {}

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

function mainMenu.drawMenu()
  love.graphics.setCanvas(mainMenu.canvas)
  local title = love.graphics.newImage("menu/assets/title.png")
  local r, g, b = love.math.colorFromBytes(43, 220, 255)
  love.graphics.setBackgroundColor(r, g, b)
  love.graphics.draw(title, mainMenu.dimX * .1875, mainMenu.dimY * .0625)
  love.graphics.setCanvas()
end

return mainMenu