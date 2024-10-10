if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Eram cinco horas da tarde. Tinha-se lembrado de ir a um agiota, mas voltou sem ousar pedir nada";
			}
			if(obj_player.x != 980){
				obj_player.sprite_index = spr_player_left;
				--obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				if(!instance_exists(tB)){
					tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
					tB.my_sprite = spr_agiota;
				}
			}
			if(counter >= segundos * 8){
				instance_destroy(obj_thinking_balloon);
				counter = 0;
				++currentStep;
			}
			break;
		case 1:
			if(obj_player.x != 1366){
				obj_player.sprite_index = spr_player_right;
				++obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				obj_player.PlayerCanMove = true;
				instance_destroy(obj_cutscene_text);
				room_goto(rm_7);
				instance_destroy();
			}
			break;
	}
}