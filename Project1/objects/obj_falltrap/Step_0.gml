// Find the nearest player
var player = instance_nearest(x, y, obj_player);

// If the player exists and is directly below the trap
if (!falling && player != noone && abs(player.x - x) < 20 && player.y > y) {
    falling = true;  // Start falling
}

// If the trap is falling, apply gravity
if (falling) {
    yspd += gravity; // Increase speed over time
    y += yspd;       // Move the trap downward
}

// If the trap collides with the floor, destroy it
if (place_meeting(x, y + yspd, obj_wall)) {
    instance_destroy();
}
