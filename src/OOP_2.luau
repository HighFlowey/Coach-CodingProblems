local module = {}

-- Advanced cooldown system

function module.PerformTests(required)
	if typeof(required) ~= "table" then
		return "module should return a table"
	end

	if typeof(required.new) ~= "function" then
		return 'table should have a function called "new"'
	end

	local class0 = required.new(5)

	if typeof(class0) ~= "table" then
		return 'the "new" function should return a class(table)'
	end

	if typeof(class0.Cooldown) ~= "number" or class0.Cooldown ~= 5 then
		return `the cooldown class should have an index called Cooldown that's set to the number given to the "new" function`
	end

	if typeof(class0.Run) ~= "function" then
		return 'class should have a method called "Run"'
	end

	local runTimes = 0
	local function RunFunction()
		runTimes += 1
	end

	class0:Run(RunFunction)

	if runTimes < 1 then
		return `the "Run" method didn't run the function given to it`
	end

	class0:Run(RunFunction)

	if runTimes > 1 then
		return `the "Run" method ran the function given to it when it's supposed to be on cooldown`
	end

	class0.Cooldown = 0
	class0:Run(RunFunction)

	if runTimes < 2 then
		return `the "Run" method didn't run the function after setting class.Cooldown to 0 to skip previous cooldown`
	end

	local class1 = required.new()
	class1.Cooldown = 3

	if class0.Cooldown == class1.Cooldown then
		return `changing the Cooldown value on a class changed it for other classes`
	end

	if class1.Run ~= class0.Run then
		return `the "Run" method on each class is a different function, this will cause memory leak! all classes should use the same function as their method`
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
