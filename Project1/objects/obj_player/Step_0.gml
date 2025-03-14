// Direction
getControls();

// Controls in the script I made
moveDir = rightKey - leftKey;

// Get my face
if (moveDir != 0) { face = moveDir; }

runType = runKey;
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

//reset jump count
if (onGround) {
    jumpCount = 0;
} else {
    if (jumpCount == 0) { jumpCount = 1; };
}

// Cap Falling Speed
if (yspd > termVal) { yspd = termVal; }

// Jump (Only Space Key)
if (jumpKeyBuffered && jumpCount < jumpMax) {
    
	//Reset buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//Increased number of jumps
	jumpCount++;
	
	yspd = jspd; // Ensure jump speed is negative to go up
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
    show_debug_message("🛡️ Player is invincible! Time left: " + string(invincible_timer));
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

if (keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left)){
	if(!is_attacking) {
		is_attacking = true;
		attack_timer = attack_duration;
		sprite_index = spr_player_fight;
		
		var attack_offset_x = face * 40; // Move hitbox forward based on facing direction
		var attack_offset_y = 10; // Adjust vertically to match the enemy height

		var attack_x = x + attack_offset_x;
		var attack_y = y + attack_offset_y; 
		var hitbox = instance_create_layer(attack_x, attack_y, layer, obj_attack);
		hitbox.direction = face;
		
		show_debug_message("Hitbox created at X: " + string(attack_x) + "Y: " + string(attack_y));
}
}

if(is_attacking){
	attack_timer -= 1;
	if(attack_timer <= 0) {
		is_attacking = false;
		sprite_index = spr_player;
	}
	
}


