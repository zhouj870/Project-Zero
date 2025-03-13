
var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

if (!place_meeting(x + _hor * move_speed, y + _ver * move_speed, obj_wall)) {
    move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, enemy_controller]);
}
