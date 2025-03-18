target_x = x
target_y = y

alarm[0] = 60
attack_range = 20;
attack_cooldown = 0;
attack_delay = 60;

move_speed = 2;

damage = 10;
enemy_health = 50;
face = 1;

if(layer_exists("Tiles_Col")){
    var tile_layer_id =layer_get_id("Tiles_Col");
    tile_maps = layer_tilemap_get_id(tile_layer_id);
}else{
    show_debug_message("Error: Layer 'Tile_Col' does not exist");
    tile_maps = noone; //to avoid errors
}
