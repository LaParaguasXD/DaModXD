

--[[
    archivo principal del mod.
    Sin él (y los demás archios),
    el mod no funcionará y el juego explotará.
]]

-- acá se cargan los items (Jokers, blinds, etc)
local mod_path = "" .. SMODS.current_mod.path

local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[DAMODXD] Loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end

-- acá se cargan las librerías (o algo así)
local files = NFS.getDirectoryItems(mod_path .. "libs/")
for _, file in ipairs(files) do
	print("[DAMODXD] Loading lib file " .. file)
	local f, err = SMODS.load_file("libs/" .. file)
	if err then
		error(err) 
	end
	f()
end

print("[DAMODXD] Loading thanks.lua")  
local f, err = SMODS.load_file("thanks.lua")  
if err then  
    error(err)  
end  
f()

------------- CODE END LMAO -------------