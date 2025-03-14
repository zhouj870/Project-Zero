if (invincible_timer <= 0) { // ✅ Only take damage if not invincible
    health -= other.damage;
    invincible_timer = 100; // ⏳ 100 frames (1.6 seconds) of invincibility
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

