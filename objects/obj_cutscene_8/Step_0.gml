if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Durante os primeiros minutos, Honório não pensou nada; foi andando, andando, andando, e ainda, sem saber como, entrou em um Café";
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
			obj_player.PlayerCanMove = true;
			if(obj_player.x == 1300){
				++currentStep;
			}
			break;
		case 2:
			room_goto(rm_9);
			instance_destroy();
			break;
	}
}