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
		Name = "Cleanup";
		Description = "Cleanup a table of connections and instances.";
		Explanations = {
			Behaviour = "Return a function that takes a table that contains objects and connections and destroys/disconnects them.";
		};
		Module = RequireModuleFromGithub("Cleanup");
		Color = Color3.new(255, 255, 0);
	};
}

return module
