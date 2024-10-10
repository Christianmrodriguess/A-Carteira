var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));

if(PlayerCanMove) {
	move_x = (_right - _left);
	move_y = (_down - _up);
	switch(move_y){
		case 1:
			sprite_index = spr_player_down;
			break;
		case -1:
			sprite_index = spr_player_up;
			break;
	}
	switch(move_x){
		case 1:
			sprite_index = spr_player_right;
			break;
		case -1:
			sprite_index = spr_player_left;
	}
	if(move_x == 0 && move_y == 0){
		sprite_index = spr_player_idle;
	}
	move_x = (_right - _left) * move_speed;
	move_y = (_down - _up) * move_speed;
	x +=move_x;
	y +=move_y;
	
	if (x < 0){
		x = 0;
	} 
	if (x > room_width - (sprite_width / 2)){
		x = room_width - (sprite_width / 2); 
	}
	
	if(y < 0){
		y = 0;
	}
	if(y > room_height - (sprite_height / 2)){
		y = room_height - (sprite_height / 2);
	}
} 

else {
	move_x = 0;
	move_y = 0;
}

