function spawn_items( pos_x, pos_y )

	local x_offset,y_offset = 5,5

	local r = ProceduralRandom( pos_x, pos_y )
	-- 20% is air, nothing happens
	if( r < 0.47 ) then return end
	r = ProceduralRandom( pos_x-11.431, pos_y+10.5257 )
	
	if( r < 0.592 ) then
	else
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", pos_x-10+x_offset, pos_y-17+x_offset, "", true )
	end
end

function spawn_chest(x, y)
	SetRandomSeed( x, y )
	local rnd = Random(1,100)
	
	if (rnd >= 50) then
		EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
	elseif (rnd >= 75) then
		EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
	end
end