if (invincible_timer <= 0) { // ✅ Only take damage if not invincible
    health -= other.damage;
    invincible_timer = 100; // ⏳ 100 frames (1.6 seconds) of invincibility

    show_debug_message("⚠️ Player hit! New Health: " + string(health));
    show_debug_message("🛡️ Player is now invincible for 100 frames.");
}
/*
if (variable_instance_exists(other, "damage")) {
    health -= other.damage;
}
invincible_timer = 60;
if(health <=0)
{
	instance_destroy();
}

*/

