if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_player.sprite_index = spr_player_angry;
			obj_amelia.sprite_index = spr_amelia_right_idle;
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.my_sprite = spr_rabisco;
			}
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = " Baile daqui, jantar dali, chapéus, leques, tanta cousa mais, que não havia remédio senão ir descontando o futuro. Endividou-se";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				obj_player.sprite_index = spr_player_idle;
				obj_amelia.sprite_index = spr_amelia_idle;
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 1:
			obj_player.PlayerCanMove = true;
			room_goto(rm_4);
			instance_destroy();
			break;
	}
}