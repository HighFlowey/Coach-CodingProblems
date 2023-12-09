local module = {}

function module.PerformTests(answer)
	do
		-- * Do tests
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

function module.Run(required_userModule)
	local bindable = Instance.new("BindableEvent")
	bindable.Parent = game

	local part = Instance.new("Part")
	part.Parent = game

	local c0 = part.Touched:Connect(doNothing)
	local c1 = part.TouchEnded:Connect(doNothing)
	local c2 = part.TouchEnded:Connect(doNothing)
	local c3 = bindable.Event:Connect(doNothing)

	local cleanupTable = {
		bindable,
		part,
		c0,
		c1,
		c2,
		c3,
	}

	local answer = required(cleanupTable)
	local result = module.PerformTests(answer)

	bindable:Destroy()
	part:Destroy()

	c0:Disconnect()
	c1:Disconnect()
	c2:Disconnect()
	c3:Disconnect()

	return result
end

return module
