-- Testing a new type of coding problem.

local module = {}

-- Template.Start

local replaceUnderscoreWithSpace = function(str: string)
	-- replace "_" with " ".
	return str:gsub(str, "_", " ")
end

-- Template.Finish
-- Return:replaceUnderscoreWithSpace

function module.PerformTests(required)
	local testArrays = {
		"replace_withSpace",
		"this_should_have_spaces",
		"yes_mhm",
	}

	if typeof(required) ~= "function" then
		return `module should return a function`
	end

	for _, str in testArrays do
		local correct = str:gsub("_", " ")
		local answer = required(str)

		if answer ~= correct then
			return `function didn't return the correct answer, correct answer: {correct} - function's answer: {answer}`
		end
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
