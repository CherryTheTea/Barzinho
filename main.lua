
nameVP = "Victor"
showText = false

--conferir seleção de objeto arrastável
sel = 0

--posição de objeto arrastável no espaço
rectpx = 200 
rectpy = 200

-- bl = botao largura
-- ba = botao altura
bl1 = 0
ba1 = 0
bl2 = 0
ba2 = 0

--estado de telas de jogo (menu/ opcoes/ jogo/ etc)
state = 1



function love.load()

    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})

--sprite victor
    victorbase = love.graphics.newImage('victorbase.png')
    victorsus = love.graphics.newImage("victorSUS.png")


--fundo
    bar = love.graphics.newImage("bar.jpg")


--assets
    copos = love.graphics.newImage('copos.png')

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

    if state == 1 then

-- fundo menu principal
            love.graphics.setColor (0, 0, 0)
            love.graphics.rectangle('fill', 0, 0, 1920, 1080)

-- desenho botao iniciar
            love.graphics.setColor(100, 100, 100)
            love.graphics.rectangle('fill', 200, 200, 450, 100)

    elseif state == 2 then

--fundo bar
           love.graphics.setColor(100, 100, 100)
           love.graphics.draw(bar, 0, 0, 0, 1.2, 1.2)

--sprite victor
           love.graphics.setColor(100, 100, 100)
           love.graphics.draw(victorbase, 150, 18, 0, 0.4, 0.4)


--textbox
           love.graphics.setColor(0, 0, 0)
           love.graphics.rectangle("fill", 150, 450, 500, 100)
    
           love.graphics.setColor(100, 0, 100)
           love.graphics.rectangle("line", 150, 450, 500, 100)
    
--nome victor
           love.graphics.setColor(100, 0, 100)
           love.graphics.print(nameVP, 150, 425)

           love.graphics.setColor(100, 100, 100)
    

--texto da caixa
           if showText == true then

               victorbase = victorsus
               love.graphics.setColor(100, 100, 100)
               love.graphics.print("isso é cringe, cara", 160, 460 )
           end


--desenhos botoes
--menu
           love.graphics.setColor(100, 100, 100)
           love.graphics.rectangle('fill', 10, 10, 10, 10)

--exit
           love.graphics.setColor(100, 100, 100)
           love.graphics.rectangle('fill', 30, 30, bl1, ba1)

--fechar menu
           love.graphics.setColor(100, 100, 0)

           love.graphics.rectangle('fill', 30, 50, bl2, ba2) -- fecha o menu

           love.graphics.setColor(100, 100, 100)

--objeto arrastável + colorir objeto
           x = love.mouse.getX( )
           y = love.mouse.getY( )

           if x >= rectpx and x <= rectpx + 50 and y >= rectpy and y <= rectpy + 50 then
                love.graphics.setColor(0, 0, 100)
           else
                love.graphics.setColor(100, 100, 100)
           end

           love.graphics.draw(copos, rectpx, rectpy, 0, 0.1, 0.1)
    --       love.graphics.rectangle('fill', rectpx, rectpy, 50, 50)
    end


end



function love.mousemoved (x, y, dx, dy, istouch)
--mover objeto arrastável
    if sel == 1 then
        rectpx = rectpx + dx
        rectpy = rectpy + dy
    end


end




function love.mousepressed (x, y, button, istouch)

--botão menu principal
    if button == 1 then
        if x >= 30 and x <= 30 + bl1 and y >= 30 and y <= 30 + ba1 then
            state = 1
        end

--botão fechar menu        
        if x >= 30 and x <= 30 + bl2 and y >= 50 and y <= 50 + ba2 then 
            bl1=0
            ba1=0
            bl2=0
            ba2=0
        end
    end

--agarrar objeto arrastável
    sel = 0
    if x >= rectpx and x <= rectpx + 50 and y >= rectpy and y <= rectpy + 50 then
        sel = 1
        
    end

--botao menu
    if button == 1 then
        if x >=10 and x <= 10 + 10 and y >= 10 and y <= 10 + 10 then
            bl1 = 150
            ba1 = 10
            bl2 = 150
            ba2= 10

        end
    end


-- botao menu principal
    if button == 1 then

        if x >= 200 and x <= 200 + 400 and y >= 200 and y <= 200 + 100 then

            state = 2

        end
    end

end


function love.mousereleased(x, y, button)
-- soltar objeto arrastável
    sel = 0    
    
end