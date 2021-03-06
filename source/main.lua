require 'libraries/class'
require 'libraries/utils'
Object = require 'libraries/classic'
Timer = require 'libraries/enhancedtimer'
sodapop = require 'libraries/sodapop'

function love.load()
	local object_files = {}
	recursiveEnum('objects', object_files)
	rqFiles(object_files)

	roomList = {}
	curRoom = nil

	goToRoom('startup')
end

function love.update(dt)
	if curRoom then curRoom:update(dt) end
end

function love.draw()
	if curRoom then curRoom:draw() end
end

function love.keypressed(key) 
	if curRoom then curRoom:keypressed(key) end
end

function love.keyreleased(key)
	if curRoom then curRoom:keyreleased(key) end
end

function goToRoom(room_type, ...)
	curRoom = _G[room_type](...)
end
