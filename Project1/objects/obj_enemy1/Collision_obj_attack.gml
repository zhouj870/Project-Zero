// Ensure this only runs if the hitbox exists and it's the correct collision target
if (instance_exists(other)) {
    
    // Reduce enemy health by 20 (this can be changed as needed)
    if (other.object_index == obj_enemy1) {  // Assuming obj_enemy1 is your enemy type
        other.enemy_health -= 20;

        // If the enemy's health reaches 0 or below, destroy it
        if (other.enemy_health <= 0) {
            show_debug_message("obj_enemy1 defeated!");
            instance_destroy(other); // Destroy the enemy instance
        }

        // If the hitbox collided with the enemy, destroy the hitbox after dealing damage
        instance_destroy(); // Destroy the hitbox instance
    }
}