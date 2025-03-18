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
    y += yspd;
}

// Stop falling when hitting the ground
if (falling && tile_maps != noone && place_meeting(x, y + yspd, tile_maps)) {
    instance_destroy();
}