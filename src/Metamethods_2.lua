local LogService = game:GetService("LogService")
local module = {}
local index, oldValue, newValue

-- Template.Start
local myTable = {}

-- print this whenever an index gets added/changed in "myTable"
print(`{index} was {oldValue} and now it's {newValue}`)

-- Template.Finish
-- Return:myTable

local function printReference(i, ov, nv)
	return `{i} was {ov} and now it's {nv}`
end

function module.PerformTests(required)
	if typeof(required) ~= "table" then
		return `module should return a table`
	end

	-- Test 1
	local c, log, shouldPrint = nil, false, printReference("a", nil, true)
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
		return `couldn't find new index in table, did you forget to add it to the proxy table?`
	end

	-- Test 2
	c, log, shouldPrint = nil, false, printReference("a", true, 100)
	required.a = 100

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

	if required.a ~= 100 then
		return `myTable.a didn't get set to the new value which is {100} and stayed as the old value which is {required.a}`
	end

	-- Test 3
	c, log, shouldPrint = nil, false, printReference("b", nil, 25)
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
		return `couldn't find new index in table, did you forget to add it to the proxy table?`
	end

	-- Passed all the tests
	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
