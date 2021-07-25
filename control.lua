pumpjack_queue = {}

function pumpjack_handler(event)
    table.insert(pumpjack_queue, event.created_entity)
end

function on_tick_handler(event)
    jack = table.remove(pumpjack_queue)
    if jack then
	if jack.mining_target then
	    --game.print("Oil patch initial amount was "..jack.mining_target.initial_amount)
	    jack.mining_target.initial_amount = 300000
	    --game.print("Oil patch initial amount now set to 300000")
	else
	    -- Reinsert since mining_target is still not set?
	    --game.print("Still no mining_target")
	    table.insert(a, jack)
	end
    end
end

script.on_nth_tick(30, on_tick_handler)

script.on_event(
    defines.events.on_built_entity,
    pumpjack_handler,
    {{filter = "name", name = "pumpjack"}})

script.on_event(
    defines.events.on_robot_built_entity,
    pumpjack_handler,
    {{filter = "name", name = "pumpjack"}})

