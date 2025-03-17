var screen_center_x = display_get_width() / 2;
var screen_center_y = display_get_height() / 2;

// Draw the "YOU DIED" text in the center of the screen
draw_set_color(c_red);  // Set text color to red
draw_text(screen_center_x - 100, screen_center_y - 50, "YOU DIED");


draw_set_color(c_white);  // Set text color to white for buttons
draw_text(screen_center_x - 50, screen_center_y + 20, "Press R to Restart");
draw_text(screen_center_x- 50, screen_center_y + 40, "Press Q to Quit");