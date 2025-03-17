enum States {
    idle,
    attack,
    walk,
    run
}

state = States.idle;  // Correct enum usage

target_x = x;
target_y = y;

alarm[0] = 60;  // Start movement update timer

move_speed = 2;

audio_play_sound(snd_boss_theme1, 1, false);
