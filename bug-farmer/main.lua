function love.load()
  canvas = love.graphics.newCanvas(800, 600)
  love.graphics.setCanvas(canvas)
  love.graphics.setBackgroundColor(.4, .3, .2)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Hello World", 350, 250)
  love.graphics.setCanvas()
end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(canvas)
end