// Manually check for obj_enemy1 within a larger area
with (obj_enemy1) {
    var hitbox_left = other.x - 60;
    var hitbox_right = other.x + 60;
    var hitbox_top = other.y - 40;
    var hitbox_bottom = other.y + 40;

    if (x > hitbox_left && x < hitbox_right && y > hitbox_top && y < hitbox_bottom) {
        show_debug_message("hitbox is inside obj_enemy1!");

        // Apply damage to the enemy only
        enemy_health -= 20; 

        // Debugging: Show new enemy health
        show_debug_message("enemy took damage! New Health: " + string(other.health));

        // If enemy dies, destroy it
        if (enemy_health <= 0) {
            show_debug_message("obj_enemy1 defeated!");
            other.instance_destroy();
        }
    }
}

// Destroy hitbox after processing
instance_destroy();
