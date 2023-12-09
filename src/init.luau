local HttpService = game:GetService("HttpService")

local function GetAsyncRetry(...)
	local success, value = pcall(HttpService.GetAsync, HttpService, ...)
	return if success then value else GetAsyncRetry(...)
end

local function RequireModuleFromGithub(name: string)
	local source = GetAsyncRetry(`https://github.com/HighFlowey/Coach-CodingProblems/blob/main/src/{name}.luau`, true)
	local info = HttpService:JSONDecode(source)
	local code = GetAsyncRetry(info.payload.blob.rawBlobUrl, false)
	return loadstring(code)()
end

local module = {
  {
	Name = "Test1";
	Description = "This is just a placeholder.";
	Explanations = {
		Title1 = "Do this and that";
		Title2 = "Do that and this";
	};
	Module = RequireModuleFromGithub("Test1");
	Color = Color3.new(255, 255, 0)};
}

return module
