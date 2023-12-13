local LogService = game:GetService("LogService")
local module = {}
local index, value

-- Template.Start
local myTable = {}

-- print this whenever an index gets added to "myTable"
print(`{index}:{value} got added to myTable`)

-- Template.Finish
-- Return:myTable

local function printReference(i, v)
	return `{i}:{v} got added to myTable`
end

function module.PerformTests(required)
	if typeof(required) ~= "table" then
		return `module should return a table`
	end

	-- Test 1
	local c, log, shouldPrint = nil, false, printReference("a", true)
	required.a = true

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

	if required.a ~= true then
		return `couldn't find new index in table, did you forget to use rawset()?`
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

	if required.b ~= 25 then
		return `couldn't find new index in table, did you forget to use rawset()?`
	end

	-- Passed all the tests
	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
