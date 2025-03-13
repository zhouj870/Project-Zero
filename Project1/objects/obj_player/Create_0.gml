//Controls setup
controlsSetup();
health = 100;
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
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrame = 18;
onGround = true;

//Attack system
is_attacking = false; 
attack_timer = 0;
attack_duration = 8;
attack_damage = 35;