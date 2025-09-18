nameVP = "Victor"
showText = false
bl1 = 0
bl2 = 0
bl3 = 0
bl4 = 0

function love.load()

    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})


--sprite victor
    victorbase = love.graphics.newImage('victorbase.png')
    victorsus = love.graphics.newImage("victorSUS.png")


--fundo
    bar = love.graphics.newImage("bar.jpg")

end



function love.keypressed(key, scancode, isrepeat)

--mostrar texto
    if key == "x" then
        showText = true
    end

--exit
   if key == "escape" then
      love.event.quit()

   end
end



function love.draw()

--fundo bar
    love.graphics.draw(bar, 0, 0, 0, 1.2, 1.2)

--sprite victor
    love.graphics.draw(victorbase, 150, 18, 0, 0.4, 0.4)


--textbox
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 150, 450, 500, 100)
    
    love.graphics.setColor(100, 0, 100)
    love.graphics.rectangle("line", 150, 450, 500, 100)
    
--nome victor
    love.graphics.print(nameVP, 150, 425)

    love.graphics.setColor(100, 100, 100)
    

--texto da caixa
    if showText == true then

    victorbase = victorsus
    love.graphics.print("isso é cringe, cara", 160, 460 )
end


--desenhos botoes
--menu
    love.graphics.rectangle('fill', 10, 10, 10, 10)

--exit
    love.graphics.rectangle('fill', 30, 30, bl1, bl2)

    love.graphics.setColor(100, 100, 0)

    love.graphics.rectangle('fill', 50, 50, bl3, bl4) -- fecha o menu

    love.graphics.setColor(100, 100, 100)



end



function love.mousepressed (x, y, button, istouch)

--botão sair
    if button == 1 then
        if x >= 30 and x <= 30 + bl1 and y >= 30 and y <= 30 + bl2 then
            love.event.quit()
        end

--botão fechar menu        
        if x >= 50 and x <= 50 + bl3 and y >= 50 and y <= 50 + bl4 then 
            bl1=0
            bl2=0
            bl3=0
            bl4=0
        end
    end

    

--botao menu
    if button == 1 then
        if x >=10 and x <= 10 + 10 and y >= 10 and y <= 10 + 10 then
            bl1 = 150
            bl2 = 10
            bl3 = 150
            bl4= 10

        end
    end
end
