//var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
//var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//move_and_collide(_hor *move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

//X  Movement
//Direction
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
jumpKeyPressed = keyboard_check_pressed(vk_space);

moveDir = rightKey - leftKey;

xspd = moveDir * move_speed;

var _subPixel = 0.5;

if place_meeting(x + xspd, y, obj_wall)
{
	//set xspd to zero for "collide"
	xspd = 0;
}

//Move

x += xspd;

//Y movement

yspd = grav; 

//cap Falling speed
if yspd > termVal {yspd = termVal};

//Jump
if jumpKeyPressed && place_meeting(x, y+1, obj_wall)
{
	yspd = jspd;
}

//Y Collision

if place_meeting(x, y + yspd, obj_wall)
{
	yspd = 0;
}

y += yspd; 

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





	
	