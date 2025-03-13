// Find the nearest player (Each enemy finds its own target)
var player = instance_nearest(x, y, obj_player);

if (player != noone && instance_exists(player)) {
    var distance_to_player = point_distance(x, y, player.x, player.y);
    var chase_range = 200;  // Max range to start chasing
    var stop_distance = 30; // Distance to stop moving

    // 🏃 MOVEMENT: Enemy chases player if within range but not too close
    if (distance_to_player < chase_range && distance_to_player > stop_distance) {
        show_debug_message("🏃 Enemy " + string(id) + " is chasing the player!");

        // Determine movement direction
        var _hor = sign(player.x - x); // Left or right
        var _ver = sign(player.y - y); // Up or down

        // Move horizontally if no wall
        if (!place_meeting(x + _hor * move_speed, y, obj_wall)) {
            x += _hor * move_speed * 0.5; // 👈 Slower movement (half speed)
        }

        // Move vertically if no wall
        if (!place_meeting(x, y + _ver * move_speed, obj_wall)) {
            y += _ver * move_speed * 0.5; // 👈 Slower movement (half speed)
        }

        // Debugging movement
        show_debug_message("🔴 Enemy " + string(id) + " position: X: " + string(x) + ", Y: " + string(y));
    }

    // ⏳ Reduce attack cooldown timer
    if (attack_cooldown > 0) {
        attack_cooldown -= 1;
    }

    // ⚔️ ATTACK: If close enough, attack when cooldown is ready
    if (distance_to_player < attack_range && attack_cooldown <= 0) {
        show_debug_message("💥 Enemy " + string(id) + " attacks player!");

        // Ensure the player's health exists before subtracting
        if (variable_instance_exists(player, "health")) {
            player.health -= 10; 
            show_debug_message("❤️ Player Health: " + string(player.health));
        } else {
            show_debug_message("⚠️ Error: Player health variable not found!");
        }

        // Reset attack cooldown
        attack_cooldown = attack_delay;
    }
}
