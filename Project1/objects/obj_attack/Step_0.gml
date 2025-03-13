
with (obj_enemy1) {
    var hitbox_left = other.x - 60;
    var hitbox_right = other.x + 60;
    var hitbox_top = other.y - 40;
    var hitbox_bottom = other.y + 40;

    if (x > hitbox_left && x < hitbox_right && y > hitbox_top && y < hitbox_bottom) {
        
        // Reduce enemy health
        enemy_health -= 20;

       
        // If enemy dies, destroy it
        if (enemy_health <= 0) {
           
            instance_destroy();
        }
    }
}

// Destroy the hitbox after checking all enemies
instance_destroy();
