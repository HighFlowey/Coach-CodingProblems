local module = {}
local c0, c1, c2, c3
local part
local bindable
local cleanupTable

local function doNothing() end

function module.PerformTests(required)
	do
		-- * Do tests
		if typeof(required) ~= "function" then
			return "module should return a function"
		end

		local answer = required

		if answer then
			return "function shouldn't return anything!"
		end

		if bindable.Parent or part.Parent then
			bindable:Destroy()
			part:Destroy()
			return "one of the instances inside the table is not destroyed!"
		end

		if c0.Connected or c1.Connected or c2.Connected or c3.Connected then
			return "one of the connections inside the table is not disconnected!"
		end

		if #cleanupTable > 0 then
			return "table still contains items! it should be empty"
		end
	end

	return true
end

function module.Run(required)
	bindable = Instance.new("BindableEvent")
	bindable.Parent = game

	part = Instance.new("Part")
	part.Parent = game

	c0 = part.Touched:Connect(doNothing)
	c1 = part.TouchEnded:Connect(doNothing)
	c2 = part.TouchEnded:Connect(doNothing)
	c3 = bindable.Event:Connect(doNothing)

	cleanupTable = {
		bindable,
		part,
		c0,
		c1,
		c2,
		c3,
	}

	local result = module.PerformTests(required)

	bindable:Destroy()
	part:Destroy()

	c0:Disconnect()
	c1:Disconnect()
	c2:Disconnect()
	c3:Disconnect()

	return result
end

return module
