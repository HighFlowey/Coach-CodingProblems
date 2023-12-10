local module = {}

-- String manipulation 1
-- make an array of string sort from longest to shortest

local function sortTextArray(array)
	local answer = {}
	local data = {}

	for _, text: string in array do
		table.insert(data, { length = #text, text = text })
	end

	table.sort(data, function(a, b)
		return a.length > b.length
	end)

	for i, v in data do
		answer[i] = v.text
	end
	return answer
end

function module.PerformTests(required)
	if typeof(required) ~= "function" then
		return "module should return a function"
	end

	local testArrays = {
		{ "ABC", "alongtext", "wwwwwww", "a", "whooohoooooo" },
		{ "abcd", "t", "this is a long text", "lets see", "game.Workspace is cringe" },
	}

	for _, array in testArrays do
		local answer = required(array)
		local rightAnswer = sortTextArray(array)
		local gotRight = 0
		local shouldGetRight = 0

		for _, _ in rightAnswer do
			shouldGetRight = gotRight
		end

		if typeof(answer) ~= "table" then
			return `module's function should return an array`
		end

		if next(answer) == nil then
			return `module's function returned an empty array`
		end

		for i, v in answer do
			if rightAnswer[i] ~= v then
				return `array returned by the function doesn't contain the right values`
			else
				gotRight += 1
			end
		end

		if gotRight ~= shouldGetRight then
			return `array returned by the function was incorrect`
		end
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
