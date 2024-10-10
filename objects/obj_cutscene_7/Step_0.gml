if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Ao enfiar pela Rua da Assembléia é que viu a carteira no chão, apanhou-a, meteu no bolso, e foi andando";
			}
			if(obj_player.x != 304){
				obj_player.sprite_index = spr_player_right;
				++obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				if(cT.text_completed && keyboard_check_pressed(vk_space)){
					instance_destroy(obj_cutscene_text);
					++currentStep;
				}
			}
			break;
		case 1:
			obj_player.x = 809;
			obj_player.y = 672;
			instance_destroy(obj_carteira);
			++currentStep;
			break;
		case 2:
			if(obj_player.x != 1366){
				obj_player.sprite_index = spr_player_right;
				++obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 3:
			obj_player.PlayerCanMove = true;
			room_goto(rm_8);
			instance_destroy();
			break;
	}
}