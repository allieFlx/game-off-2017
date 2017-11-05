require 'libraries/class'
Object = require 'libraries/classic'
Timer = require 'libraries/enhancedtimer'
sodapop = require 'libraries/sodapop'

function love.load()
	local object_files = {}
	recursiveEnum('objects', object_files)
	rqFiles(object_files)

	timer = Timer()
end

function love.update(dt)
	timer:update(dt)
end

function love.draw()
	
end

function love.keypressed(key)
	
end
