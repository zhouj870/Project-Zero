if (invincible_timer <= 0) { 
	health -= other.damage;
    invincible_timer = 100; 
	
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

