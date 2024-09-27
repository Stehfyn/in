local ini_parser = require "in.parser"

local file = io.open("example.ini", "r")

for section, _ in pairs(ini_parser.parse(file)) do
    print(section)

    for key, value in pairs(_) do
        print(key .. " = " .. value)
    end
end
