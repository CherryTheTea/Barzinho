local component = require 'badr'
local button    = require 'components.button'
local main_menu
local sub_menu


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

--estado de telas de jogo (menu - 1/ jogo - 2/ opcoes - 3 /etc)
state = 1



function love.load()

    ui_Initialization()

    ui_init2()

    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})

--selecao de numero aleatorio
    randomnumber = love.math.random(1, 2)

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

      main_menu:draw()

    elseif state == 2 then

--fundo bar
           love.graphics.setColor(100, 100, 100)
           love.graphics.draw(bar, 0, 0, 0, 1.2, 1.2)

--Sorteio + carregamento personagem
           npc = randomnumber
           love.graphics.setColor(100, 100, 100)
           if npc == 1 then
                   love.graphics.draw(victorbase, 150, 18, 0, 0.4, 0.4)
           elseif npc == 2 then
                   love.graphics.draw(victorsus, 150, 18, 0, 0.4, 0.4)
               end


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

                  sub_menu:draw()

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


    --agarrar objeto arrastável
    sel = 0
    if x >= rectpx and x <= rectpx + 50 and y >= rectpy and y <= rectpy + 50 then
        sel = 1
    end

end


function love.mousereleased(x, y, button)
-- soltar objeto arrastável
    sel = 0    
    
end


--menu princial
function ui_Initialization()
    love.graphics.setBackgroundColor({ 1, 1, 1 })
    local clicks = 0
    main_menu = component { column = true, gap = 10 }
        + button { text = 'New game', width = 200, onClick = function() state = 2 end }
        + button { text = 'Settings', width = 200 }
        + button { text = 'Credits', width = 200 }
        + button { text = 'Quit', width = 200, onClick = function() love.event.quit() end }

    main_menu:updatePosition(
        love.graphics.getWidth() * 0.5 - main_menu.width * 0.5,
        love.graphics.getHeight() * 0.5 - main_menu.height * 0.5
    )
end

function love.update()
    main_menu:update()
end

--menu em jogo
function ui_init2()  
     local clicks = 0
    sub_menu = component { column = true, gap = 10 }
        + button { text = 'Continue', width = 200, onClick = function() state = 2 end }
        + button { text = 'Settings', width = 200 }
        + button { text = 'Back to Menu', width = 200, onClick = function() state = 1 end }
        + button { text = 'Quit', width = 200, onClick = function() love.event.quit() end }

    sub_menu:updatePosition(
        love.graphics.getWidth() * 0.5 - sub_menu.width * 0.5,
        love.graphics.getHeight() * 0.5 - sub_menu.height * 0.5
    )
end

function love.update()
    sub_menu:update()
end