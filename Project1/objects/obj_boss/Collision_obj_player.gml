if (other.invincible_timer <= 0) { 
	var damage = other.health / 2; 
	other.health -= damage; // Apply damage
    
    
   
    other.invincible_timer = 100; // 1.6 seconds of invincibility
	
	
	
}
if(other.health<0){
    instance_destroy(other);
}