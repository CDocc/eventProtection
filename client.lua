---Trigger a protected server event from the client
---@param eventName string The name of the event to trigger
---@param ... any Additional parameters to pass to the event handler
function sEvents(eventName, ...)
    TriggerServerEvent("sEvents:triggerProtectedEvent", eventName, ...)
end

-- Make the function available to other resources
exports('triggerProtectedEvent', sEvents)

-- Add an alias for resources that might expect a table
local eventsTable = {}

---Trigger a protected server event from the client
---@param eventName string The name of the event to trigger
---@param ... any Additional parameters to pass to the event handler
function eventsTable.trigger(eventName, ...)
    sEvents(eventName, ...)
end

-- Return the events table for use within this resource
return eventsTable