local resources = {
font = love.graphics.newImageFont("gfx/font/font-1.png"," abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\""),
window = love.graphics.newImage("gfx/system/window.png"),
button = love.graphics.newImage("gfx/system/button.png")
}

local text_box = require("libs/text_box")
text_box.window = resources.window
text_box.button = resources.button
text_box.font = resources.font

function love.draw()
	text_box:draw()
end

function love.update()
	text_box:update()
	text_box:show{string = "SURPRISE MOTHERFUCKER))0))", face = "gfx/facesets/o.jpg"}
	text_box:show{string = "Salut, folks!"}
	text_box:show{string = "I'm a big boi!", time = 0.25}
	text_box:clear()
end