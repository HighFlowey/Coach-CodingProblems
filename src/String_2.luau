local module = {}

function module.PerformTests(required)
	if typeof(required) ~= "function" then
		return "module should return a function"
	end

	local testArrays = {
		[[
		local simpleBoolean = false
		local randomStuff = "lol"
		local aNumber = 500
		local aBoolean = true
	]],
		[[
		local aBoolean = true
		local aString = "testin"
		local abomination = "zart"-+.wow
	]],
	}

	for _, sourcecode in testArrays do
		local answer = required(sourcecode)

		local rightAnswer = {}
		for i, v in string.gmatch(sourcecode, "local%s+(%w+)%s*=%s*(%S+)") do
			rightAnswer[i] = v
		end

		if typeof(rightAnswer) ~= "table" then
			return "returned value should be a table!"
		end

		if next(rightAnswer) == nil then
			return "returned table can't be empty!"
		end

		for i, v in rightAnswer do
			if rightAnswer[i] and rightAnswer[i] == v then
				continue
			end

			return `one of the items in the returned table was wrong: {i} = {v}`
		end
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
