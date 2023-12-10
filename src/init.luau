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
}

return module
