local module = {}

-- turn seconds into minutes:seconds

function module.PerformTests(required)
	if typeof(required) ~= "function" then
		return "module should return a function"
	end

	local testArrays = {
		60,
		30.3,
		90.5,
		150,
		360,
	}

	for _, n in testArrays do
		local answer = required(n)
		local rightAnswer = ""
		do
			local minutes = math.round(n / 60)
			local seconds = math.round((minutes * 60) - n)
			rightAnswer = `{minutes}:{seconds}`
		end

		if typeof(answer) ~= "string" then
			return `module's function should return a string`
		end

		if answer ~= rightAnswer then
			return `module's function returned the wrong string, right answer: {rightAnswer}, module's answer: {answer}`
		end
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module