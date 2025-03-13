
if (variable_instance_exists(other, "damage")) {
    health -= other.damage;
} else {
    health -= 10; 
}

invincible_timer = 60;


if(health <= 0) {
    instance_destroy();
}