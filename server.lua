local sEvents = {}
local registeredEvents = {}

---Register a protected server event
---@param eventName string The name of the event to register
---@param handler function The handler function to call when event is triggered
function sEvents.register(eventName, handler)
    if not registeredEvents[eventName] then
        if type(handler) == 'function' then
            registeredEvents[eventName] = handler
            print(string.format("Event '%s' registered successfully", eventName))
        else
            print(string.format("Error: Event '%s' has no handler function defined", eventName))
        end
    else
        print(string.format("Error: Event '%s' is already registered", eventName))
    end
end

---Trigger a protected server event
---@param source number The source of the event trigger
---@param eventName string The name of the event to trigger
---@param ... any Additional parameters to pass to the event handler
function sEvents.trigger(source, eventName, ...)
    if registeredEvents[eventName] then
        registeredEvents[eventName](source, ...)
    else
        print(string.format("Error: Attempted to trigger unregistered event '%s'", eventName))
    end
end

---Validate and trigger an event from a client
RegisterServerEvent("sEvents:triggerProtectedEvent")
AddEventHandler("sEvents:triggerProtectedEvent", function(eventName, ...)
    local src = source
    -- You could add additional validation here
    sEvents.trigger(src, eventName, ...)
end)

-- Make the sEvents table available to other resources
exports('getEventSystem', function()
    return sEvents
end)

-- Return sEvents for use within this resource
return sEvents