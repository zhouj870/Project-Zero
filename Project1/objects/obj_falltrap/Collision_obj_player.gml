if (falling) { 
    if (other.invincible_timer <= 0) { 
        other.health -= damage; 
        other.invincible_timer = 100; 

        show_debug_message("Falling trap hit player! Player health: " + string(other.health));
    }

    // Destroy the trap after hitting the player
    instance_destroy();
}