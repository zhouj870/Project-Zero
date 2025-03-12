function Extra(){
if (keyboard_check(ord("A")) and !instance_place(x-move_speed, y, obj_block)) {
		x += -move_speed
		image_xscale = -2
	}

	if (keyboard_check(ord("D")) and !instance_place(x+move_speed, y, obj_block)) {
		x += move_speed
		image_xscale = 2
	}

	if (keyboard_check(ord("W"))) {
		show_debug_message("jumping...")
		if (instance_place(x,y+1,obj_block)) {
			vspeed = jump_height
		}
	}

	if (place_meeting(x, y+1, obj_block)) {
		gravity = 0
	} else {
		gravity = 0.25;
	}
}