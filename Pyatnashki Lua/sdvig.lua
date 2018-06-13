function MoveUP( tableGame )
	local x = 0
	local y = 0
	for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] == 0 then
				x = i
				y = j
			end
		end
	end
	if  y ~= 1 then
		bufer = tableGame[x][y-1]
		tableGame[x][y-1] = tableGame[x][y]
		tableGame[x][y] = bufer
	end
end

function MoveDown( tableGame )
	local x = 0
	local y = 0
	for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] == 0 then
				x = i
				y = j
			end
		end
	end
	if  y ~= 4 then
		bufer = tableGame[x][y+1]
		tableGame[x][y+1] = tableGame[x][y]
		tableGame[x][y] = bufer
	end
end

function MoveLeft( tableGame )
	local x = 0
	local y = 0
	for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] == 0 then
				x = i
				y = j
			end
		end
	end
	if x ~= 1 then
		bufer = tableGame[x-1][y]
		tableGame[x-1][y] = tableGame[x][y]
		tableGame[x][y] = bufer
	end
end

function MoveRight( tableGame )
	local x = 0
	local y = 0
	for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] == 0 then
				x = i
				y = j
			end
		end
	end
	if x ~= 4 then
		bufer = tableGame[x+1][y]
		tableGame[x+1][y] = tableGame[x][y]
		tableGame[x][y] = bufer
	end
end

function MoveMouse (tableGame, x, y )
	local offsetX = 0
	local offsetY = 50
	if x > (0 + offsetX)  and x < (400 + offsetX) and y > (0 + offsetY) and y < (400 + offsetY) then
		local imgx = x - offsetX -- переместить изображение туда, где мышь нажата
      	local imgy = y - offsetY
      
	    local chooseX = math.ceil(imgx/100) -- от 1 до 4
	    local chooseY = math.ceil(imgy/100) -- от 1 до 4

	    local xNULL = 0
		local yNULL = 0
		for i=1,4 do
			for j=1,4 do
				if tableGame[i][j] == 0 then
					xNULL = i
					yNULL = j
				end
			end
		end

		if (xNULL == chooseX and yNULL == (chooseY - 1)) or (xNULL == chooseX and yNULL == (chooseY + 1)) or (xNULL == (chooseX+1) and yNULL == chooseY) or (xNULL == (chooseX-1) and yNULL == chooseY) then
			bufer = tableGame[chooseX][chooseY]
			tableGame[chooseX][chooseY] = tableGame[xNULL][yNULL]
			tableGame[xNULL][yNULL] = bufer
		end

	end 
end

function StartGame( tableGame )
	for i=1,200 do
		x = math.random(1,4)
		if x == 1 then
			 MoveUP( tableGame )
		elseif x == 2 then
			MoveDown( tableGame )
		elseif x == 3 then	
			MoveLeft( tableGame )
		else 
			MoveRight( tableGame )
		end
	end
end

function EndGame( tableGame )
	local EndGame = {
        {1, 5, 9, 13},
        {2, 6, 10, 14},
        {3, 7, 11, 15},
        {4, 8, 12, 0}
    }
    for i=1,4 do
		for j=1,4 do
			if tableGame[i][j] ~= EndGame[i][j] then
				return false
			end
		end
	end
	return true
end