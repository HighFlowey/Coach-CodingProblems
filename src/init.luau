local HttpService = game:GetService("HttpService")
HttpService.HttpEnabled = true

local function RequireModuleFromGithub(name: string)
  local source = HttpService:GetAsync(`https://github.com/HighFlowey/Coach-CodingProblems/blob/main/src/{name}.luau`, true)
  local info = HttpService:JSONDecode(source)
  local code = HttpService:GetAsync(info.payload.blob.rawBlobUrl, true)
  return loadstring(code)()
end

local module = {
  {Name = "Test1", Module = RequireModuleFromGithub("Test1"), Color = Color3.new(255, 255, 0)}
}

return module
