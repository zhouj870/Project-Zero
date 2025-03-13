//Player health bar
var bar_x = 20; 
var bar_y = 20; 
var bar_width = 200; 
var bar_height = 20; 
var bar_border = 2; 

//Filled part of bar
var health_percent = health / max_health;
var bar_fill = bar_width * health_percent;

//Border
draw_set_color(c_black);
draw_rectangle(bar_x - bar_border, bar_y - bar_border, bar_x + bar_width + bar_border, bar_y + bar_height + bar_border, false);

//Background
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Green health
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + bar_fill, bar_y + bar_height, false);

//Text amount
draw_set_color(c_white);
draw_text(bar_x + bar_width / 2 - 20, bar_y + 2, string(health) + " / " + string(max_health));
