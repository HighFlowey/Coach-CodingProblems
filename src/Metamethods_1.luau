local LogService = game:GetService("LogService")
local module = {}
local index, value

-- Template.Start
local class = {}

-- print this whenever an index gets added to "class"
print(`{index}:{value} got added to class`)

-- Template.Finish
-- Return:class

local function printReference(index, value)
	return `{index}:{value} got added to class`
end

function module.PerformTests(required)
	if typeof(required) ~= "table" then
		return `module should return a table`
	end

	-- Test 1
	local c, log, shouldPrint = nil, false, printReference("a", true)
	required.a = true

	print("Debugging Metamethods #1")
	c = LogService.MessageOut:Connect(function(msg)
		print(msg, shouldPrint)
		if msg == shouldPrint then
			log = true
		end
	end)

	task.wait(0.5)
	c:Disconnect()

	if log ~= true then
		return `didn't print: {shouldPrint}`
	end

	-- Test 2
	c, log, shouldPrint = nil, false, printReference("a", 100)
	required.a = 100

	c = LogService.MessageOut:Connect(function(msg)
		if msg == shouldPrint then
			log = true
		end
	end)

	task.wait(0.5)
	c:Disconnect()

	if log == true then
		return `should't print: {shouldPrint}, because index already existed`
	end

	-- Test 3
	c, log, shouldPrint = nil, false, printReference("b", 25)
	required.b = 25

	c = LogService.MessageOut:Connect(function(msg)
		if msg == shouldPrint then
			log = true
		end
	end)

	task.wait(0.5)
	c:Disconnect()

	if log ~= true then
		return `didn't print: {shouldPrint}`
	end

	-- Passed all the tests
	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
