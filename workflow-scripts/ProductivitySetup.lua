local awful = require("awful")

local ProductivitySetup = {}

ProductivitySetup.Productivity = {}

function ProductivitySetup.Productivity:new(name, runners)
    --[[
    The ProductivitySetup.Productivity Class have name for its declaration in ProductivitySetup.
    And its runners to be ran.

    If name is "Productivity", it will be changed to "productivity"

    runner : {
        command: String,
        position: Table
            Ex: {tag = "4"}
    }
    --]]

    assert(name and runners, "Missing arguments")
    if name == "Productivity" then name = "productivity" end

    local newProductivity = {name = name, runners = runners}
    self.__index = self
    setmetatable(newProductivity, self)

    ProductivitySetup[name] = newProductivity

    return newProductivity
end

function ProductivitySetup.Productivity:run()
    -- Basically a wrapper for awful.spawn
    for _, runner in ipairs(self.runners) do
        awful.spawn(runner.command, runner.position)
    end
end

-- List of productivities here
ProductivitySetup.Productivity:new("classroom", {
    {command = "firefox classroom.google.com", position = {tag="", screen = 1}},
    {command = "firefox todoist.com", position = {tag="", screen = 2}},
    {command = "notion-app", position = {tag="", screen = 2}},
    {command = "discord"}
})

return ProductivitySetup
