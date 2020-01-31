function spawn_potion_altar(x, y)
	local r = ProceduralRandom( x, y )
	
	if (r > 0.42) then
		LoadPixelScene( "data/biome_impl/potion_altar.png", "data/biome_impl/potion_altar_visual.png", x-5, y-15, "", true )
	end
end

function spawn_heart( x, y )
	local r = ProceduralRandom( x, y )
	SetRandomSeed( x, y )
	-- local r=1
	-- 2018.11.15 - Petri 
	-- changed this from 0.4 -> 0.7 quite a big upping of heart spawns
	-- done for testing 

	if (r > 0.574) then
		local entity = EntityLoad( "data/entities/items/pickup/heart.xml", x, y)
	else
		SetRandomSeed( x+45, y-2123 )
		local rnd = Random( 1, 100 )
		
		if (rnd <= 90) or (y < 512 * 3) then
			rnd = Random( 1, 1000 )
			
			if ( rnd < 1000 ) then
				local entity = EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
			else
				local entity = EntityLoad( "data/entities/items/pickup/chest_random_super.xml", x, y)
			end
		else
			local entity = EntityLoad( "data/entities/animals/chest_mimic.xml", x, y)
		end
	end
end