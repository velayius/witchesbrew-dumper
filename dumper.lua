-- a modified version of a old constant dumper.
local blacklistedconsts = {
    "getfenv",
    "string",
    "bit32",
    "pairs",
    "select",
    "math",
    "rawset",
    "rawequal",
    "rawget",
    "pairs",
    "next",
    "setfenv",
    "error",
    "assert",
    "pcall",
    "getmetatable",
    "debug",
    "unpack",
    "setmetatable",
    "tonumber",
    "math",
    "type",
    "bit32",
    "table",
    "tostring",
    "bit"
}
local _ENV = {["old_env"]=(getfenv)or(_ENV), ["bconsts"]=blacklistedconsts}
old_env["setmetatable"](_ENV, {
    __index = function(table, key)
        local found 
        for index, value in old_env["pairs"](blacklistedconsts) do
            if old_env["rawequal"](value, key) then found = true end
        end
        if not found then 
        old_env["print"](key)
        end
        return old_env[key]
    end
})

old_env['pcall'](function()
-- obfucator code goes here
end)
