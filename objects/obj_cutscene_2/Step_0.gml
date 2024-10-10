if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_player.sprite_index = spr_player_sad;
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.my_sprite = spr_rabisco;
			}
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "A dívida não parece grande para um homem da posição de Honório, que advoga; mas todas as quantias são grandes ou pequenas, segundo as circunstâncias, e as dele não podiam ser piores";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				obj_player.sprite_index = spr_player_idle;
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 1:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Gastos de família excessivos, principalmente por agradar à mulher, que vivia aborrecida da solidão";
			}
			if (obj_amelia.image_alpha < 1) {
				obj_amelia.image_alpha += fade_speed;
				if (obj_amelia.image_alpha > 1) {
					obj_amelia.image_alpha = 1;
				}
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				counter = 0;
				++currentStep;
			}
			break;
		case 2:
			obj_player.PlayerCanMove = true;
			room_goto(rm_3);
			instance_destroy();
			break;
	}
}