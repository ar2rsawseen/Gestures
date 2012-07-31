local font = TTFont.new("tahoma.ttf", 20)

local myText = TextField.new(font, "Result: ")
myText:setPosition(50,50)
stage:addChild(myText)

local function callback(name)
	myText:setText(name)
end

local gest = Gestures.new({
	debug = true,
	draw = true,
	drawColor = 0xff0000,
	drawWidth = 5,
	autoTrack = true,
	scope = stage,
	allowRotation = true,
	inverseShape = true,
	points = 33
})

gest:addGesture("Line", {
	{x = 0, y = 0},
	{x = 0, y = 100}
}, callback)

gest:addGesture("Square", {
	{x = 0, y = 0},
	{x = 200, y = 0},
	{x = 200, y = 200},
	{x = 0, y = 200},
	{x = 0, y = 0}
}, callback)

gest:addGesture("Rectangle", {
	{x = 0, y = 0},
	{x = 210, y = 0},
	{x = 210, y = 100},
	{x = 0, y = 100},
	{x = 0, y = 0}
}, callback)

gest:addGesture("ZigZag", {
	{x = 0, y = 0},
	{x = 50, y = 87},
	{x = 100, y = 0},
	{x = 150, y = 87},
}, callback)

gest:addGesture("Triangle", {
	{x = 0, y = 0},
	{x = 100, y = 100},
	{x = 0, y = 100},
	{x = 0, y = 0}
}, callback)

gest:addGesture("Equilateral Triangle", {
	{x = 0, y = 0},
	{x = 50, y = 87},
	{x = 100, y = 0},
	{x = 0, y = 0}
}, callback)

gest:addGesture("Check", {
	{x = 0, y = 0},
	{x = 50, y = 50},
	{x = 100, y = 0},
}, callback)

local x = 0
local y = -100
local circle = {}
local totalPoints = 72
local step = (math.pi*2)/totalPoints

for angle = 1, totalPoints do
	local newX = x*math.cos(angle*step)-y*math.sin(angle*step)
	local newY = y*math.cos(angle*step)+x*math.sin(angle*step)
	local point = {x = newX, y = newY}
	table.insert(circle, point)
end

gest:addGesture("Circle", circle, callback)