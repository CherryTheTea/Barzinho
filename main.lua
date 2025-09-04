nameVP = "Victor"
showText = false



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

    
    love.graphics.rectangle('fill', 300, 250, 150, 150)    --desenho botao


end



function love.mousepressed (x, y, button, istouch)

    
    if button == 1 then                                                     --botao clicavel
        if x >=300 and x <= 300 + 150 and y >= 250 and y <= 250 + 150 then
            love.event.quit()
        end
    end
end






