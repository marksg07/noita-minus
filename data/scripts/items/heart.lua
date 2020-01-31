dofile( "data/scripts/game_helpers.lua" )

function item_pickup( entity_item, entity_who_picked, name )

	local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
	local variablestorages = EntityGetComponent( entity_who_picked, "VariableStorageComponent" )

	local max_hp_old = 0
	local max_hp = 0
	local multiplier = 1
	
	local x, y = EntityGetTransform( entity_item )

	if ( variablestorages ~= nil ) then
		for key,comp_id in pairs(variablestorages) do 
			local var_name = ComponentGetValue( comp_id, "name" )
			if ( var_name == "hearts_more_extra_hp" ) then
				multiplier = ComponentGetValueInt( comp_id, "value_int" )
			end
		end
	end

	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) )
			max_hp_old = max_hp
			max_hp = max_hp + 0.6 * multiplier

			local max_hp_cap = tonumber( ComponentGetValue( damagemodel, "max_hp_cap" ) )
			if max_hp_cap > 0 then
				max_hp = math.min( max_hp, max_hp_cap )
			end
			
			-- if( hp > max_hp ) then hp = max_hp end
			ComponentSetValue( damagemodel, "max_hp", max_hp)
		end
	end

	EntityLoad("data/entities/particles/image_emitters/heart_effect.xml", x, y-12)
	EntityLoad("data/entities/particles/heart_out.xml", x, y-8)
	local description = GameTextGet( "$logdesc_heart", tostring(math.floor(max_hp*25)) )
	if max_hp == max_hp_old then
		description =  GameTextGet( "$logdesc_heart_blocked", tostring(math.floor(max_hp*25)) )
	end

	GamePrintImportant( "$log_heart", description )
	GameTriggerMusicCue( "item" )

	-- remove the item from the game
	EntityKill( entity_item )
end
 