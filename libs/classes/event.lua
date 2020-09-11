event = {}

event.__index = event

function event.new(image, type, keys_table, pos_table)
	local ev = {}
	setmetatable(ev, event)

	ev.image = image or nil
	ev.type = type or 'plain'
	ev.keys = keys_table or nil
	ev.x = pos_table.x or 0
	ev.y = pos_table.y or 0
	
	return ev
end

function event:draw()
--reference members here with 'self'
end