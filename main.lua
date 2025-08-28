nameVP = "Vitor"
showText = false

function love.load()

    vitorsus = love.graphics.newImage("vitorSUS.png")

    bar = love.graphics.newImage("bar.jpg")

end



function love.keypressed(key, scancode, isrepeat)

    if key == "x" then
        showText = true
    end

   if key == "escape" then
      love.event.quit()

   end
end


function love.draw()

    love.graphics.draw(bar, 0, 0, 0, 1.2, 1.2)

    love.graphics.setColor(100, 100, 100)
    love.graphics.draw(vitorsus, 150, 18, 0, 0.4, 0.4)


--textbox

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 150, 450, 500, 100)
    
    love.graphics.setColor(100, 0, 100)
    love.graphics.rectangle("line", 150, 450, 500, 100)
    
    love.graphics.print(nameVP, 150, 425)

    love.graphics.setColor(100, 100, 100)
    
    if showText == true then
    
  --  love.graphic.print(text, 160, 460)
    love.graphics.print("isso é cringe, cara", 160, 460 )
end

end
