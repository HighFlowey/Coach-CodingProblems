local HttpService = game:GetService("HttpService")

local function GetAsyncRetry(...)
	local success, value = pcall(HttpService.GetAsync, HttpService, ...)
	return if success then value else GetAsyncRetry(...)
end

local function RequireModuleFromGithub(name: string)
	local source = GetAsyncRetry(`https://github.com/HighFlowey/Coach-CodingProblems/blob/main/src/{name}.luau`, true)
	local info = HttpService:JSONDecode(source)
	local code = GetAsyncRetry(info.payload.blob.rawBlobUrl, true)
	return loadstring(code)()
end

local module = {
	{
		Name = "Cleanup",
		Description = "Cleanup a table of connections and instances.",
		Explanations = {
			Behaviour = "Return a function that takes a table that contains objects and connections and destroys/disconnects them.",
		},
		Module = RequireModuleFromGithub("Cleanup"),
		Color = Color3.fromRGB(255, 255, 0),
	},
	{
		Name = "OOP #1",
		Description = "Create a module that can create oop classes.",
		Explanations = {
			Behaviour = 'The module should return a table that contains a function called "new"',
			NewFunction = 'The "new" function should return a table that has a method called "Init"',
			InitMethod = 'The "Init" method should set self.Initialized to true',
		},
		Module = RequireModuleFromGithub("OOP_1"),
		Color = Color3.fromRGB(255, 255, 0),
	},
	{
		Name = "OOP #2",
		Description = "Create a module that creates a class by using OOP(ObjectOrientedProgramming), this class will manage cooldowns.",
		Explanations = {
			Behaviour = 'The module should return a table that contains a function called "new"',
			NewFunction = 'The "new" function should return a table that has a method called "Run" and an Index/Property called Cooldown which is set to the number you get from the "new" function',
			RunMethod = `This method should run the function it receives when the class is not on cooldown`,
			CooldownProperty = `When this property changes the cooldown should change aswell`,
		},
		Module = RequireModuleFromGithub("OOP_2"),
		Color = Color3.fromRGB(255, 200, 0),
	},
	{
		Name = "Simple Cooldown",
		Description = "Create a module that returns a function that gives functions cooldowns and runs them when theyre not on cooldown.",
		Explanations = {
			Function = "The module should return a function that takes the following arguments: (callback: function, time: number)",
			Behaviour = `Each function should have it's own cooldown based on the time value, when the time value changes the cooldown should change aswell`,
		},
		Module = RequireModuleFromGithub("Cooldown"),
		Color = Color3.fromRGB(0, 255, 0),
	},
	{
		Name = "String Manipulation #1",
		Description = "Create a module that returns a function that sorts an array of strings from longest to shortest by the string length.",
		Explanations = {
			ExampleArgument = '{"huge", "lol", }, "GetService("ScriptEditorService")"}',
			ExampleAnswer = '{"GetService("ScriptEditorService")", "game.Workspace = cringe", "huge", "lol"}',
		},
		Module = RequireModuleFromGithub("String_1"),
		Color = Color3.fromRGB(255, 150, 0),
	},
}

return module
