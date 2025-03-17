var follow_range = 200;

if (instance_exists(obj_player)) {
    var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    if (dist_to_player <= follow_range) {
        // Follow the player only if within range
        target_x = obj_player.x;
        target_y = obj_player.y;
    } else {
        // If out of range, stay in place or patrol
        if (point_distance(x, y, target_x, target_y) < 5) {
            target_x = random_range(xstart - 100, xstart + 100);
            target_y = random_range(ystart - 100, ystart + 100);
        }
    }
} else {
    // Default idle movement if the player is gone
    if (point_distance(x, y, target_x, target_y) < 5) {
        target_x = random_range(xstart - 100, xstart + 100);
        target_y = random_range(ystart - 100, ystart + 100);
    }
}

// Keep alarm looping
if (alarm[0] < 0) {
    alarm[0] = 60;
}

