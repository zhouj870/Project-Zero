// Find the nearest player 
var player = instance_nearest(x, y, obj_player);

if (player != noone && instance_exists(player)) {
    var distance_to_player = point_distance(x, y, player.x, player.y);
    var chase_range = 200;  // Max range to start chasing
    var stop_distance = 30; // Distance to stop moving

    // MOVEMENT: Enemy chases player if within range but not too close
    if (distance_to_player < chase_range && distance_to_player > stop_distance) {
   
        // Determine movement direction
        var _hor = sign(player.x - x); // Left or right
        var _ver = sign(player.y - y); // Up or down

        // Move horizontally if no wall
        if (!place_meeting(x + _hor * move_speed, y, obj_wall)) {
            x += _hor * move_speed * 0.3; 
        }

        // Move vertically if no wall
        if (!place_meeting(x, y + _ver * move_speed, obj_wall)) {
            y += _ver * move_speed * 0.3; 
        }

        

    //Reduce attack cooldown timer
    if (attack_cooldown > 0) {
        attack_cooldown -= 1;
    }

    // ATTACK: If close enough, attack when cooldown is ready
    if (distance_to_player < attack_range && attack_cooldown <= 0) {
       
        // Ensure the player's health exists before subtracting
        if (variable_instance_exists(player, "health")) {
            player.health -= 10; 
           
        } else {
            show_debug_message(" Player health variable not found!");
        }

        // Reset attack cooldown
        attack_cooldown = attack_delay;
    }
}
}