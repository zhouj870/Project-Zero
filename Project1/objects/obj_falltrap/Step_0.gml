// Find the nearest player
var player = instance_nearest(x, y, obj_player);

// Ensure tile_maps is valid before using it
if (!variable_instance_exists(id, "tile_maps") || tile_maps == noone) {
    show_debug_message("ERROR: tile_maps is not initialized properly!");
}

// Define the trigger range
var trigger_x_range = 20;  // Horizontal distance to trigger fall
var trigger_y_threshold = 10; // Player must be at least this far below the spikes

// Ensure the trap does not fall instantly
if (!falling && player != noone) {
    if (abs(player.x - x) < trigger_x_range && player.y > y + trigger_y_threshold) {
        falling = true;  
        show_debug_message("Trap triggered! Player detected below.");
    }
}

// Apply gravity only after trap is triggered
if (falling) {
    yspd = min(yspd + gravity, 8); // Apply gravity but limit max fall speed

    // Check if the object will collide with the ground
    if (!place_meeting(x, y + yspd, tile_maps)) {
        y += yspd;
    } else {
        // Align with the ground properly and destroy
        while (!place_meeting(x, y + sign(yspd), tile_maps)) {
            y += sign(yspd);
        }
        instance_destroy();
    }
}