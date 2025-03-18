// Calculate direction towards target
var _hor = target_x - x;
var _ver = target_y - y;

// Calculate the distance to the target
var dist = point_distance(x, y, target_x, target_y);

// Avoid division by zero and normalize the movement direction
if (dist > 0.1) { // Using a small threshold to avoid tiny movements
    _hor /= dist;
    _ver /= dist;
} else {
    _hor = 0;
    _ver = 0;
}

// Ensure tile_maps is valid before checking collisions
if (!variable_instance_exists(id, "tile_maps") || tile_maps == noone) {
    show_debug_message("ERROR: tile_maps is not initialized properly!");
}

// Attempt to move while avoiding collisions
if (!place_meeting(x + _hor * move_speed, y + _ver * move_speed, tile_maps)) {
    move_contact_solid(_hor * move_speed, _ver * move_speed);
} else {
    // If direct movement is blocked, try horizontal movement first
    if (!place_meeting(x + _hor * move_speed, y, tile_maps)) {
        move_contact_solid(_hor * move_speed, 0);
    } 
    // If horizontal movement is also blocked, try vertical movement
    else if (!place_meeting(x, y + _ver * move_speed, tile_maps)) {
        move_contact_solid(0, _ver * move_speed);
    }
}