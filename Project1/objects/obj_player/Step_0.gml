// Direction
getControls();

// WASD and Arrow Key Movement
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
moveDir = rightKey - leftKey;

// Get my face
if (moveDir != 0) { face = moveDir; }

var runKey = keyboard_check(vk_shift);
runType = runKey ? 1 : 0;
xspd = moveDir * move_speed[runType];

var _subPixel = 0.5;

// Check for X-axis collision before moving
if (!place_meeting(x + xspd, y, obj_wall)) {
    x += xspd;
} else {
    xspd = 0;
}

// Y Movement
yspd += grav;

if (onGround) {
    jumpCount = 0;
} else {
    if (jumpCount == 0) { jumpCount = 1; }
}

// Cap Falling Speed
if (yspd > termVal) { yspd = termVal; }

// Jump (Only Space Key)
if (keyboard_check_pressed(vk_space) && onGround) {
    yspd = -jspd; // Ensure jump speed is negative to go up
    onGround = false;
}

// Check for Y-axis collision before moving
if (!place_meeting(x, y + yspd, obj_wall)) {
    y += yspd;
} else {
    yspd = 0;
}

// Set if I'm on the ground
if (place_meeting(x, y + 1, obj_wall)) {
    onGround = true;
    yspd = 0;
} else {
    onGround = false;
}



//i frames to stop rapid hp loss
if (invincible_timer > 0) {
    invincible_timer -= 1;
}

// Sprite Control
if (abs(xspd) > 0) { sprite_index = walkSpr; }
// Running
if (abs(xspd) >= move_speed[1]) { sprite_index = runSpr; }
// Not moving
if (xspd == 0) { sprite_index = idleSpr; }
// In the air
if (!onGround) { sprite_index = jumpSpr; }

mask_index = idleSpr;
