parser = {}

local function nand(a, b)
    return not (a and b)
end

local function xnor(a, b)
    return (not a == not b)
end

local function extract(s)
    if s then
        for k, v in string.gmatch(s, "([%w_]+)%s*=%s*([%w_]+)") do
            return k, v
        end
    end
end

local function insert(t, s, k, v)
    if k and v then
        assert(not t[s][k])
        t[s][k] = v
    end
end

function parser.parse(file)
    local result       = {}
    local this_section = nil

    while true do
        local line = file.read(file, "*line")
        if not line then break end

        local section = string.match(line, "^%s*%[[a-zA-Z]+%]%s*$")
        if section then this_section = section result[this_section] = {} end
        
        local key, value = extract(string.match(line, "^%s*[%w_]+%s*=%s*[%w_]+%s*$"))
        assert(nand(section, key) and xnor(key, value))
        insert(result, this_section, key, value)
    end

    return result
end

return parser
