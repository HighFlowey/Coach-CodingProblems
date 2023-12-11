local module = {
	{
		Name = "Cleanup",
		Description = "Cleanup a table of connections and instances.",
		Explanations = {
			Behaviour = "Return a function that takes a table that contains objects and connections and destroys/disconnects them.",
		},
		Module = "Cleanup",
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
		Module = "OOP_1",
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
		Module = "OOP_2",
		Color = Color3.fromRGB(255, 200, 0),
	},
	{
		Name = "Simple Cooldown",
		Description = "Create a module that returns a function that gives functions cooldowns and runs them when theyre not on cooldown.",
		Explanations = {
			Function = "The module should return a function that takes the following arguments: (callback: function, time: number)",
			Behaviour = `Each function should have it's own cooldown based on the time value, when the time value changes the cooldown should change aswell`,
		},
		Module = "Cooldown",
		Color = Color3.fromRGB(0, 255, 0),
	},
	{
		Name = "String Manipulation #1",
		Description = "Create a module that returns a function that sorts an array of strings from longest to shortest by the string length.",
		Explanations = {
			ExampleArgument = '{"huge", "lol", "game.Workspace = cringe", "GetService("ScriptEditorService")"}',
			ExampleAnswer = '{"GetService("ScriptEditorService")", "game.Workspace = cringe", "huge", "lol"}',
		},
		Module = "String_1",
		Color = Color3.fromRGB(255, 150, 0),
	},
	{
		Name = "Turn seconds into readable time",
		Description = "Create a module that returns a function that turns seconds into readable time (example: 70 -> 1:10, 5 -> 0:05).",
		Explanations = {
			Behaviour = "Module's function should turn seconds in to readable date",
			Example = `90 -> "1:30"`,
			Warning = "Remove decimals from the number",
		},
		Module = "ReadableDate",
		Color = Color3.fromRGB(0, 255, 0),
	},
	{
		Name = "String Manipulation #2",
		Description = "Take a script's sourecode and get all the variables from it and store it into a table.",
		Explanations = {
			Example = `"local a = true local b = 100" -> {'{a = "true", b = "100"}'}`,
		},
		Module = "String_2",
		Color = Color3.fromRGB(255, 150, 0),
	},
	{
		Name = "String Manipulation #3",
		Description = `Take a string and whenever a "_" appears, replace it with " " (space).`,
		Explanations = {},
		Module = "String_3",
		Color = Color3.fromRGB(0, 255, 0),
	},
}

return module
