local module = {}

local function RightAnswer(t1, t2)
	local t3 = {}

	for i, v in t1 do
		t3[v] = t2[i]
	end

	return t3
end

function module.PerformTests(required)
	local ids = {
		624089,
		428598,
		9864378,
		2462640,
	}

	local golds = {
		100,
		50,
		25,
		90,
	}

	if typeof(required) ~= "function" then
		return `module should return a function`
	end

	local answer = required(ids, golds)
	local rightAnswer = RightAnswer(ids, golds)

	if typeof(answer) ~= "table" then
		return `module's function should return an array`
	end

	if next(answer) == nil then
		return `module's function returned an empty array`
	end

	for i, v in answer do
		if rightAnswer[i] ~= v then
			return `array returned by the function doesn't contain the right values`
		end
	end

	return true
end

function module.Run(required)
	local result = module.PerformTests(required)

	return result
end

return module
