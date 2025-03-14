if (other.invincible_timer <= 0 && attack_cooldown <= 0) { // ✅ Ensure cooldown applies
    other.health -= damage;
    attack_cooldown = attack_delay; // 🛑 **Set attack cooldown so enemy must wait**

    show_debug_message("💥 Enemy " + string(id) + " hit the player! Cooldown started.");

    // ⏳ Set invincibility time for the player to prevent rapid damage spam
    other.invincible_timer = 100; // 👈 **Player gets 1.6 seconds of invincibility after getting hit**

    // Player counterattack logic (if attacking)
    if (other.is_attacking) {
        var attack_range = 20;
        var attack_x = other.x + (other.face * attack_range);

        if (point_in_rectangle(attack_x, other.y, x - 10, y - 10, x + 10, y + 10)) {
            health -= other.attack_damage;
            show_debug_message("🗡️ Player hit enemy! Enemy Health: " + string(health));

            if (health <= 0) {
                show_debug_message("☠️ Enemy " + string(id) + " defeated!");
                instance_destroy();
            }
        }
    }
}
