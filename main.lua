nameVP = "Victor"
showText = false
bl1 = 0
bl2 = 0


function love.load()

    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})

    vitorsus = love.graphics.newImage("vitorSUS.png")

    bar = love.graphics.newImage("bar.jpg")

end



function love.keypressed(key, scancode, isrepeat)

    if key == "x" then  --mostrar texto
        showText = true
    end

   if key == "escape" then --sair do jogo
      love.event.quit()

   end
end



function love.draw()

    love.graphics.draw(bar, 0, 0, 0, 1.2, 1.2)             --fundo bar

    love.graphics.setColor(100, 100, 100)                  --sprite victor
    love.graphics.draw(vitorsus, 150, 18, 0, 0.4, 0.4)


--textbox

    love.graphics.setColor(0, 0, 0)                        --caixa de texto
    love.graphics.rectangle("fill", 150, 450, 500, 100)
    
    love.graphics.setColor(100, 0, 100)
    love.graphics.rectangle("line", 150, 450, 500, 100)
    
    love.graphics.print(nameVP, 150, 425)                  --nome victor

    love.graphics.setColor(100, 100, 100)
    
    if showText == true then                               --texto da caixa
    
    love.graphics.print("isso é cringe, cara", 160, 460 )
end

    
    love.graphics.rectangle('fill', 10, 10, 10, 10)    --desenho botao menu

    love.graphics.rectangle('fill', 30, 30, bl1, bl2)  --desenho botao exit


end



function love.mousepressed (x, y, button, istouch)

--botao exit
    if button == 1 then
        if x >= 30 and x <= 30 + bl1 and y >= 30 and y <= 30 + bl2 then
            love.event.quit()
        end
    end

    

--botao menu
    if button == 1 then
        if x >=10 and x <= 10 + 10 and y >= 10 and y <= 10 + 10 then
            bl1 = 150
            bl2 = 10

        end
    end
end





