if (!variable_instance_exists(id, "health")) {
    health = 100; // Default value if missing
    show_debug_message("WARNING: Player health was missing. Setting to 100.");
} else {
    show_debug_message("Player health initialized correctly.");
}


//Controls setup
controlsSetup();
self.health = 100; 
max_health = 100;
//Sprites
invincible_timer = 0;
idleSpr = spr_player;
walkSpr = spr_player_walk;
runSpr = spr_run;
jumpSpr = spr_player_jump;

//moving
face = 1;
runType = 0;
xspd = 0;
yspd = 0;
move_speed[0] = 2.5;
move_speed[1] = 4;
moveDir = 0;



//jumping
grav = .275;
termVal = 4;
jspd = -6.15;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrame = 18;
onGround = true;

//Attack system
is_attacking = false; 
attack_timer = 0;
attack_duration = 8;
attack_damage = 35;
tile_maps = layer_instance_get_instance("Tiles_Col");

//Cheats
cheat_invincible = false; 
cheat_full_health_key = ord("H");
cheat_invincible_key = ord("I");