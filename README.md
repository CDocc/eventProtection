# Event Protection System

A security layer for FiveM server events that protects against unauthorized event triggering through a registration system.

## What is it?

Event Protection allows you to secure your `TriggerServerEvent` calls by requiring events to be registered on the server before they can be triggered by clients.

### Installation

Import Event Protection in your resource by adding this to your `fxmanifest.lua`:

## How to use?
```lua
client_scripts {
    "@eventProtection/client.lua",
}

server_scripts {
    "@eventProtection/server.lua",
}
```

Create new server event (server-side)
```lua
-- Get the event protection system
local sEvents = exports['eventProtection']:getEventSystem()

-- Register a protected event
sEvents.register("yourEventName", function(source, yourArgs)
    -- source is the player ID that triggered the event
    print("Event triggered by:", source)
    print("With arguments:", yourArgs)
end)
```

Use an events (client-side)
```lua
sEvents("yourEventName", "myArgs")

-- Direct function call
exports['eventProtection']:triggerProtectedEvent("yourEventName", "yourArgument")

-- Or using the returned table (if you've imported the file)
local events = exports['eventProtection']:getEventSystem()
events.trigger("yourEventName", "yourArgument")
```

## Security Benefits

- Events must be registered on the server before they can be triggered
- Prevents unauthorized event triggering attempts
- Provides clear logging of event registration and triggers
- Centralized event management system

## Best Practices

- Register all your events at server startup
- Use descriptive event names that indicate their purpose
- Add additional validation in your event handlers to verify parameters
- Consider including resource name in your event names for better organization

## Credits to DevSakai for the original resource - https://github.com/DevSekai/TempEvents-OBSELETE-
## I have simply just refactored the code and provided a little better instructions of use case.