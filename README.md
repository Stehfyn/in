# .[in]i parser
An actually tiny .ini parser

## usage
```lua
local ini_parser = require "parser"

local file = io.open("example.ini", "r")

for section, _ in pairs(ini_parser.parse(file)) do
    print(section)

    for key, value in pairs(_) do
        print(key .. " = " .. value)
    end
end
```
## output
```
C:\dev\in>.\..\LuaJIT\src\luajit.exe example.lua
[options]
you_get = the_picture
[extras]
1 = wow
epic = n0sc0p3
[facts]
win32_is_hard = skill_issue
```
