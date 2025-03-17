// Reduce attack cooldown timer
if (attack_cooldown > 0) {
    attack_cooldown -= 1;
}

// Ensure the enemy stays on the ground
if (!place_meeting(x, y + 1,tile_maps)) {
    y += 3; // Gravity effect to keep the enemy on the ground
}

// FIND THE NEAREST PLAYER PROPERLY
var closest_player = noone;
var closest_distance = 999999;

// Loop through all players to find the nearest one
var i;
for (i = 0; i < instance_number(obj_player); i++) {
    var temp_player = instance_find(obj_player, i);
    
    if (instance_exists(temp_player)) { //  Ensure player instance exists
        var dist = point_distance(x, y, temp_player.x, temp_player.y);
        
        if (dist < closest_distance) {
            closest_distance = dist;
            closest_player = temp_player;
        }
    }
}

//  Debug Message to Check if a Player is Found
if (closest_player == noone) {
    show_debug_message(" ERROR: Enemy " + string(id) + " could not find a valid player!");
} else {
    show_debug_message(" Enemy " + string(id) + " found player at distance: " + string(closest_distance));
}

// CHECK IF PLAYER EXISTS & IS WITHIN CHASE RANGE
if (instance_exists(closest_player) && closest_player.object_index == obj_player) {
    var distance_to_player = point_distance(x, y, closest_player.x, closest_player.y);
    var chase_range = 350;  // detection range
    var stop_distance = 40; //  to ensure enemies can attack properly

    // MOVEMENT
    if (distance_to_player < chase_range && distance_to_player > stop_distance) {
        var _hor = sign(closest_player.x - x); // Move left or right

        // Jump Over Small Obstacles 
        if (place_meeting(x + _hor * move_speed, y, tile_maps) &&
            !place_meeting(x + _hor * move_speed, y - 10, tile_maps)) {  
            y -= 10; 
            show_debug_message("Enemy " + string(id) + " jumped over a small obstacle!");
        }

        //  Move only if there's NO wall ahead and the enemy will NOT walk off a ledge
        if (!place_meeting(x + _hor * move_speed, y, tile_maps) &&
            place_meeting(x + _hor * move_speed, y + 1, tile_maps) &&  // Ground check
            place_meeting(x + _hor * move_speed, y + 10, tile_maps)) {  //  Ensure there is ground ahead

            x += _hor * move_speed * 0.3;
			sprite_index = spr_boss_walk;
            show_debug_message("Enemy " + string(id) + " is MOVING! New X: " + string(x) + " New Distance: " + string(distance_to_player));
        } else {
			sprite_index = spr_boss_idle;
            show_debug_message("Enemy " + string(id) + " is blocked! Wall or no ground ahead.");
        }
    } else {
		sprite_index = spr_boss_idle;
        show_debug_message("Enemy " + string(id) + " is too far to chase. Distance: " + string(distance_to_player));
    }
}
   
