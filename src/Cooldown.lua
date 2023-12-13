local module = {}

-- Simple cooldown system

function module.PerformTests(required)
	if typeof(required) ~= "function" then
		return "module should return a function"
	end

	local function1_callTimes = 0
	local function1 = function()
		function1_callTimes += 1
	end

	local function2_callTimes = 0
	local function2 = function()
		function2_callTimes += 1
	end

	required(function1, 3)

	if function1_callTimes < 1 then
		return `the function given to the module didn't run even though it isnt supposed to be on cooldown`
	end

	required(function1, 3)

	if function1_callTimes > 1 then
		return `the function given to the module should be on cooldown, but it ran which means it ignored the cooldown`
	end

	required(function2, 3)

	if function2_callTimes < 1 then
		return `2 functions were used on the module but only the first one worked`
	end

	required(function2, 0)

	if function2_callTimes < 2 then
		return `the time value given to the module was 0 but the module still used the previous time value to check for cooldown`
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
