
function love.load()
	math.randomseed( os.time() )
	love.window.setMode(400, 450)
	offsetX = 50
	background = love.graphics.newImage("background.png")
	tableGame = {
        {1, 5, 9, 13},
        {2, 6, 10, 14},
        {3, 7, 11, 15},
        {4, 8, 12, 0}
    }

    require "sdvig"

    mainFont = love.graphics.newFont(30);
	love.graphics.setFont(mainFont);

	StartGame( tableGame )
	isfinish = false

	imgx = 1
   	imgy = 1

   	timeGame = 0
end
 
function love.update(dt)
	if isfinish == false then 
		timeGame = timeGame + dt
	end
end
 

function love.keypressed(key, unicode)
	if isfinish == false then 
		if key == "up" or key == "w" then
			MoveUP( tableGame )
			isfinish = EndGame( tableGame )
		elseif key == "down"  or key == "s" then
			MoveDown( tableGame )
			isfinish = EndGame( tableGame )
		elseif key == "left"  or key == "a" then
			 MoveLeft( tableGame )
			 isfinish = EndGame( tableGame )
		elseif key == "right"  or key == "d" then
			MoveRight( tableGame )
			isfinish = EndGame( tableGame )
		end
	end
	if key == "escape" then
		love.event.quit()
	end
	if key == "r" then
		love.load()
	end
end

function love.keyreleased(key, unicode)
end 

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
   		imgx = x
   		imgy = y
   		MoveMouse (tableGame, x, y )
   		isfinish = EndGame( tableGame )
   end
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
   end
end

function love.draw()
	love.graphics.setColor(250, 250, 250)
	love.graphics.draw(background, 0, offsetX)
	box9 = love.graphics.newImage("9.png")
	for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] then
				if	tableGame[i][j] > 9 then
					love.graphics.draw(box9, 100*(i-1)+4 , 100*(j-1)+4 + offsetX )
					love.graphics.print(tableGame[i][j], 100*(i-1)+35 , 100*(j-1)+35 + offsetX)
				elseif tableGame[i][j] ~= 0 then
					love.graphics.draw(box9, 100*(i-1)+4, 100*(j-1)+4 + offsetX)
					love.graphics.print(tableGame[i][j], 100*(i-1)+45 , 100*(j-1)+35 + offsetX)
				end
			end
		end
	end
	if isfinish == true then
		star = love.graphics.newImage("Star.png")
		love.graphics.draw(star, 0, offsetX)
	end


	love.graphics.print("Time : " .. string.format("%25.3f", timeGame), 0, 0)
end