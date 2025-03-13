// Ensure this only runs if the hitbox exists
if (instance_exists(other)) {
    
    // Reduce enemy health
    enemy_health -= 20;

    

    // If enemy dies, destroy it
    if (enemy_health <= 0) {
        show_debug_message("obj_enemy1 defeated!");
        instance_destroy();
    }

    // Destroy the hitbox after dealing damage
    other.instance_destroy();
}
