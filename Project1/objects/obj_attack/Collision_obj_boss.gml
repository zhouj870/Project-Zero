

// Check if enemy is inside the hitbox area
var hitbox_left = x - 30;
var hitbox_right = x + 30;
var hitbox_top = y - 15;
var hitbox_bottom = y + 15;

// Get enemy position
var enemy_x = other.x;
var enemy_y = other.y;

// If the enemy is inside the hitbox range, apply damage
if (enemy_x > hitbox_left && enemy_x < hitbox_right && enemy_y > hitbox_top && enemy_y < hitbox_bottom) {
    other.health -= 20;

  
    //knockback
    other.xspd = sign(x - other.x) * 3; 

    // If enemy dies, destroy it
    if (other.health <= 0) {
        show_debug_message("Enemy defeated.");
        instance_destroy(other);
    }

    // Destroy hitbox after hitting
    instance_destroy();
}

	

