//var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
//var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//move_and_collide(_hor *move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

//X  Movement
//Direction
getControls()

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

//Move

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
if jumpKeyPressed && onGround
{
	yspd = jspd;
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






	
	