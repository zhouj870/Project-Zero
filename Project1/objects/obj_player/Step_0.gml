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
if (place_meeting(x + xspd, y, tile_maps)) {
	var _pixelCheck = _subPixel * sign(xspd);
	while( !place_meeting(x + _pixelCheck, y, tile_maps))
	{
		x += _pixelCheck;
	}
	
    xspd = 0;
} else {
    
	x += xspd;
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
if (place_meeting(x, y + yspd, tile_maps)) {
    
	 yspd = 0;
} else {
    y += yspd;
}

// Set if I'm on the ground
if (place_meeting(x, y + 1, tile_maps)) {
    onGround = true;
    yspd = 0;
} else {
    onGround = false;
}

if (keyboard_check_pressed(cheat_invincible_key)) {
    cheat_invincible = !cheat_invincible;
    show_debug_message("Invincibility Cheat: " + string(cheat_invincible));

    if (!cheat_invincible) {
        invincible_timer = 0; // Reset invincibility when cheat is turned off
    }
}

if (cheat_invincible) {
    invincible_timer = 9999999;
} else {
    if (!cheat_invincible && invincible_timer > 0) {
        invincible_timer -= 1;
    }
}


if (keyboard_check_pressed(cheat_full_health_key)) {
    self.health = 100;
    show_debug_message("Full Health Cheat Activated! Health: " + string(health));
}

if (cheat_invincible) {
    invincible_timer = 9999999;
} else {
    if (invincible_timer > 0) {
        invincible_timer -= 1;
    }
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


if (keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left)){
	if(!is_attacking) {
		is_attacking = true;
		attack_timer = attack_duration;
		sprite_index = spr_player_fight;
		
		var attack_offset_x = face * 10; // Move hitbox forward based on facing direction
		var attack_offset_y = 5; // Adjust vertically to match the enemy height

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
	}
	
}

if(health <= 0)
{
	room.goto(rm_gameover);
}




