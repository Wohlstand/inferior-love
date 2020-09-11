local text_box = {}

text_box.string = ""
text_box.printed_string = ""
text_box.string_pos = 0
text_box.previous_string = {[0] = ""}

text_box.timer = 0.8
text_box.tempTimer = 0

text_box.active = nil

text_box.draw_window = true

text_box.window = nil
text_box.button = nil
text_box.face = nil

text_box.allign = 2
text_box.font = nil

text_box.scale = 1

text_box.button_str = "Z"

function text_box:show(args)
	if self.active == true then return end
	
	for k,v in ipairs(self.previous_string) do
		if args.string == v then
			return
		end
	end
	
	if args.window == 'transparent' then
		self.draw_window = false
	else
		self.draw_window = true
	end
	
	if args.face ~= nil then
		self.face = love.graphics.newImage(args.face)
	else
		self.face = nil
	end
	
	self.string = args.string or ""
	self.allign = args.allign or 2
	self.timer = args.time or 0.8
	self.scaled = false
	self.active = true
end

function text_box:stop()
	self.active = false
	
	table.insert(self.previous_string, self.string)
	
	self.string = ""
	self.printed_string = ""
	self.string_pos = 0
end

function text_box:clear()
	if self.active == true then return end
	
	for i = 0, #self.previous_string do 
		self.previous_string[i]=nil 
	end
end

function text_box:draw()
	if self.active == nil or self.active == false then return end
	
	if self.window ~= nil and self.draw_window then
		love.graphics.setColor(1, 1, 1, 0.75)
		love.graphics.draw(self.window, 0, (128 * self.allign) + (32 * math.floor(self.allign / 2)), 0, 1, self.scale)
		love.graphics.setColor(1, 1, 1, 1)
	end
	
	if self.string ~= nil then
		local vx = 0
		
		if self.font ~= nil then love.graphics.setFont(self.font) end
		
		if self.face ~= nil then
			vx = 96
		end
		love.graphics.printf(self.printed_string, 24 + vx, 16 + ((128 * self.allign) + (32 * math.floor(self.allign / 2))), love.graphics.getWidth() - (48 + vx))
	end
	
	if self.string_pos >= #self.string and self.button ~= nil then
		if not self.draw_window then
			love.graphics.setColor(1, 1, 1, 0.5)
		end
		love.graphics.draw(self.button, love.graphics.getWidth() - 48, (128 * self.allign) + (128 - 32) + (32 * math.floor(self.allign / 2)))
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.print(self.button_str, love.graphics.getWidth() - 40, (128 * self.allign) + (128 - 30) + (32 * math.floor(self.allign / 2)))
	end
	
	if self.face ~= nil then
		love.graphics.draw(self.face, 16, 16 + (128 * self.allign) + (32 * math.floor(self.allign / 2)))
	end
end

function text_box:update()
	if (self.active == nil or self.active == false) then return end
	
	if self.string_pos < #self.string then
		self.tempTimer = self.tempTimer + self.timer
	
		if self.tempTimer > 1 then
			self.tempTimer = 0
			self.string_pos = self.string_pos + 1
			self.printed_string = string.sub(self.string, 0, self.string_pos)
		end
	elseif self.string_pos >= #self.string then
		if love.keyboard.isDown(self.button_str:lower()) then
			self:stop()
		end
	end
end

return text_box