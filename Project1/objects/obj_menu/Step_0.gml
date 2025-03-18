//get input
var up_key = keyboard_check_pressed(vk_up);
var down_key = keyboard_check_pressed(vk_down);
var acceptKey = keyboard_check_pressed(vk_enter);


pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

//using options
if acceptKey {
	switch(pos)
	{
		//start game
		case 0:
			room_goto_next();
		break;
			
		// controls help
		case 1:
	       show_message("Controls: Use Arrow Keys to Navigate, Enter to Select.\nUse either arrow keys or WASD keys to move. In order to jump pressed the spacebar. Pressing the spacebar again would allow you to double jump.\nTo attack press the Z button and character will attack");
		break;
	
		//Quit Game
		case 2:
		game_end();
		break;
	}
}