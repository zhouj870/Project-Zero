show_debug_message(" Collision detected with " + object_get_name(other.object_index) + " (ID: " + string(other.object_index) + ")");

if (instance_exists(other) && other.object_index == obj_player) {  
	
    show_debug_message(" Collision confirmed with obj_player!");

    if (!is_undefined(other.health)) {  // Ensure `health` exists before modifying it
        show_debug_message("obj_player's health exists. Current Health: " + string(other.health));

        if (other.invincible_timer <= 0) { // Prevents rapid hits
            other.health -= damage; 
            other.invincible_timer = 75; //  75 frames (1.25 sec) of invincibility
			
            show_debug_message("Enemy " + string(id) + " hit the player! New Health: " + string(other.health));
			
			audio_play_sound(snd_sword_attack_enemy1, 1, false); 
            //  Apply enemy attack cooldown
            attack_cooldown = attack_delay;
			 if (other.health <= 0) {
                show_debug_message(" Player has died. Destroying obj_player...");
                instance_destroy(other.id); // Destroy the player instance
            }
        } else {
            show_debug_message(" Player is invincible, no damage applied.");
        }
    } else {
        show_debug_message(" ERROR: `health` is undefined in obj_player during collision!");
    }
} else {
    show_debug_message(" ERROR: Collision event triggered but `other` is NOT obj_player!");
}
