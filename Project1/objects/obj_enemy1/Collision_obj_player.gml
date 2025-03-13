if (other.invincible_timer <= 0) {
	other.health -= damage;
	if (other.is_attacking) {
		var attack_range = 20;
		var attack_x = other.x + (other.face * attack_range);
	
		if(point_in_rectangle(attack_x, other.y, x - 10, y -10, x+10, y+10)){
		
		health -= other.attack_damage;
	
		if(health < 0) {
		instance_destroy();
		
	}
	}
}
}