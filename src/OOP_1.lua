local module = {}

function module.PerformTests(required)
	if typeof(required) ~= "table" then
		return "module should return a table"
	end

	if typeof(required.new) ~= "function" then
		return 'table should have a function called "new"'
	end

	local class0 = required.new()

	if typeof(class0) ~= "table" then
		return 'the "new" function should return a class(table)'
	end

	if typeof(class0.Init) ~= "function" then
		return 'class should have a method called "Init"'
	end

	class0:Init()

	if class0.Initialized ~= true then
		return "class should have an index called Initialized set to true after using the Init method"
	end

	local class1 = required.new()

	if class1.Initialized == true then
		return "second class created with this module has an index called Initialized without calling the Init method"
	end

	class0.Initialized = false
	class1:Init()

	if class0.Initialized == true then
		return "using the Init method on a class has set Initalized to true on other classes"
	end

	if class1.Init ~= class0.Init then
		return "the Init method on each class is a different function, this will cause memory leak! all classes should use the same function as their method"
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
