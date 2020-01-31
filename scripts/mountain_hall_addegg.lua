RegisterSpawnFunction( 0xff9393d3, "spawn_egg" )

g_egg =
{
	total_prob = 0,
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/pickup/egg_worm.xml"
	},
}

function spawn_egg( x, y )
	spawn( g_egg, x, y )
end