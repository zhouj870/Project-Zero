if (keyboard_check_pressed(vk_enter)) {
    obj_game.game_state = "tutorial"; // Move to tutorial state
    show_debug_message("Game state changed to TUTORIAL")
}

if (game_state == "tutorial" && keyboard_check_pressed(vk_enter)) {
    game_state = "playing"; // Transition to the main game
}