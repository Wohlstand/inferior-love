local camera = {}

camera.__index = camera
cn = {}

function camera.define()
	setmetatable(cn, camera)
   
	cn.x = 0
	cn.y = 0
	cn.width = love.graphics.getWidth()
	cn.height=  love.graphics.getHeight()
   
	return cn
end

return camera