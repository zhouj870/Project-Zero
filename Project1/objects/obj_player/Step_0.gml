//Direction
getControls()

var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
moveDir = rightKey - leftKey;


//Get my face
if moveDir != 0 {face = moveDir};

runType = runKey;
xspd = moveDir * move_speed[runType];

var _subPixel = 0.5;

if place_meeting(x + xspd, y, obj_wall)
{
	//set xspd to zero for "collide"
	xspd = 0;
}

//X  Movement

x += xspd;

//Y movement

yspd += grav; 

if onGround 
{
	jumpCount = 0;
} else {
	if jumpCount == 0 {jumpCount = 1;}
}

//cap Falling speed
if yspd > termVal {yspd = termVal};

//Jump
if (keyboard_check_pressed(vk_space) && onGround) {
    yspd = -jspd;
    onGround = false;
}
//Y Collision

if place_meeting(x, y + yspd, obj_wall)
{
	yspd = 0;
}

y += yspd; 

//set if I'm on the ground

if yspd >= 0 && place_meeting(x,y+1,obj_wall)
{
	onGround = true;
} else {
	onGround = false;
}

//Sprite Control
if abs(xspd) > 0 {sprite_index = walkSpr};
//Running
if abs(xspd) >= move_speed[1] {sprite_index = runSpr};
//Not moving
if xspd == 0 {sprite_index = idleSpr};
//In the air
if !onGround {sprite_index = jumpSpr};

	mask_index = idleSpr;






	
	