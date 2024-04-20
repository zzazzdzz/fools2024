console:log("Lua based local checker for challenge 4 by TheZZAZZGlitch")

actions = {}

function readSolution()
    for line in io.lines("solution.txt") do
        if string.sub(line, 1, 1) == ";" then
            -- year 2024, still no continue statement
            goto continue
        end
        local fields = {}
        for field in (line .. " "):gmatch("%w+") do
            table.insert(fields, field)
        end
        if #fields < 2 then
            goto continue
        end
        local frame = tonumber(table.remove(fields, 1), 10)
        local addr = tonumber(table.remove(fields, 1), 16)
        if actions[frame] == nil then
            actions[frame] = {}
        end
        while #fields > 0 do
            val = tonumber(table.remove(fields, 1), 16)
            if addr > 0x3FFFFFF then
                console:log(string.format(
                    "[!] Write to $%.8X not allowed.",
                    addr
                ))
            elseif addr < 0x2000000 then
                console:log(string.format(
                    "[!] Write to $%.8X not allowed.",
                    addr
                ))
            elseif val > 0xff or val < 0 then
                console:log(string.format(
                    "[!] Not a valid value: $%.2X",
                    val
                ))
            else
                local s = {}
                s["addr"] = addr
                s["val"] = val
                table.insert(actions[frame], s)
            end
            addr = addr + 1
        end
        ::continue::
    end
end

function noInput()
    emu:clearKeys(0xffffffff)
end

function runFrame()
    local frameIndex = emu:currentFrame()
    buf:setName("FRAME: " .. frameIndex)
    if actions[frameIndex] ~= nil then
        for _, action in pairs(actions[frameIndex]) do
            console:log(string.format(
                "[frame %i] Setting $%.8X to $%.2X", 
                frameIndex, action.addr, action.val
            ))
            emu:write8(action.addr, action.val)
        end
    end
end

buf = console:createBuffer("IMPORTANT")
buf:print("IMPORTANT INFORMATION:\n")
buf:print("If you wish to reload the script (for example, because you changed\n")
buf:print("your solution), remember to reset the Lua interpreter first by\n")
buf:print("choosing File -> Reset.\n")
buf:print("Only then reload the script with File -> Load.\n")
buf:print("Otherwise, your memory writes might get duplicated.")

console:log("Reading solution.txt...")
readSolution()
console:log("Running your solution (feel free to speed up emulation)")
cbFrame = callbacks:add("frame", runFrame)
cbKeys = callbacks:add("keysRead", noInput)
emu:reset()
