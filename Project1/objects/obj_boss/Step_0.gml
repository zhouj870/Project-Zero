var _hor = target_x - x;
var _ver = target_y - y;

// Calculate the distance to the target
var dist = point_distance(x, y, target_x, target_y);

// Avoid division by zero by checking if the distance is greater than a small threshold
if (dist > 0) {
    // Normalize the direction vector
    _hor /= dist;
    _ver /= dist;
} else {
    // If the distance is zero, just set the movement vector to zero
    _hor = 0;
    _ver = 0;
}

if (!place_meeting(x + _hor * move_speed, y + _ver * move_speed, obj_wall)) {
    move_and_collide(_hor * move_speed, _ver * move_speed, [obj_wall, enemy_controller]);
}