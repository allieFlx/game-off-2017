startgame = Object:extend()

function startgame:new()
	self.area = Area()
	self.timer = Timer()
	timer = self.timer

	newSprite = {}
	newSprite = sodapop.newAnimatedSprite(0,0)
	newSprite:addAnimation('idle', {
		image = love.graphics.newImage 'resources/bb_idle_01.png',
		frameWidth = 128,
		frameHeight = 128,
		frames = {
		{1,1,1,1,1}
		},
	})
	newSprite:addAnimation('walk', {
		image = love.graphics.newImage 'resources/bb_walk_sheet.png',
		frameWidth = 128,
		frameHeight = 128,
		frames = {
		{1,1,2,1,.2},
		},
	})

	player1 = self.area:addGameObject('Entity', 300, 300, {
		player = true, 
		sprite = newSprite
	})

	curDir = 0
	t = {}
	t.x = 0
	t.mode = 'manual'
	logString = 'Nothing to report'
end

function startgame:update(dt)
	self.area:update(dt)
	self.timer:update(dt)

	if love.keyboard.isDown('left') then
		if curDir ~= -1 then player1.sprite:switch 'walk' end
		player1.sprite.flipX = true
		player1.x = player1.x - 1
		curDir = -1
	end
	if love.keyboard.isDown('right') then
		if curDir ~= 1 then player1.sprite:switch 'walk' end
		player1.sprite.flipX = false
		player1.x = player1.x + 1
		curDir = 1
	end
	if not love.keyboard.isDown('left') and not love.keyboard.isDown('right')
	then
		player1.sprite:switch 'idle'
		curDir = 0
	end
end

function torch(key)
	if key == 'left' then
		t.mode = 'tween'
		timer:tween(.3, t, {x= player1.x - 200}, 
			'in-out-cubic', function() t.mode = 'manual' end )
	end
	if key == 'right' then
		t.mode = 'tween'
		timer:tween(.3, t, {x= player1.x + 200}, 
			'in-out-cubic', function() t.mode = 'manual' end)
	end
	if key == 'none' then
		t.mode = 'tween'
		timer:tween(.3, t, {x = player1.x},
			'in-out-cubic', function () t.mode = 'manual' end)
	end
end

function startgame:keypressed(key)
	torch(key)	
end

function startgame:keyreleased(key)
	if not love.keyboard.isDown('left') and not love.keyboard.isDown('right')	
	then
		torch('none')
	end
end

function startgame:draw()
	dx = 0
	if t.mode == 'manual' then dx = player1.x + (curDir * 200)
	else dx = t.x end
	love.graphics.circle('line',dx,player1.y,200)
	self.area:draw()
	love.graphics.print(logString, 300, 20)
end
