replace_biomes = {
    "coalmine", "coalmine_alt", "crypt", "dragoncave", "excavationsite", "fungicave",
    "rainforest", "snowcastle", "snowcave", "snowcave_petri", "vault", "vault_frozen",
    "wandcave"
}

for i, biome in ipairs(replace_biomes) do
    ModLuaFileAppend("data/scripts/biomes/" .. biome .. ".lua", "mods/noita-minus/scripts/" .. biome .. "_fixspawns.lua")
end

ModLuaFileAppend("data/scripts/biome_scripts.lua", "mods/noita-minus/scripts/biome_scripts_fixspawns.lua")