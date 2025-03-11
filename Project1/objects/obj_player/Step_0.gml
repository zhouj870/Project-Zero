var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor *move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);


	if (keyboard_check(vk_up)) {
		show_debug_message("jumping...")
		if (place_meeting(x,y+1,obj_block)) {
			vspeed = jump_height
		}
	}

	if (place_meeting(x, y+1, obj_block)) {
		gravity = 0
		
	} else {
		gravity = 0.25;
	}