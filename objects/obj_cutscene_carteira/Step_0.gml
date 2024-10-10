if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_player.sprite_index = spr_player_idle;
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_homem_loja.x, obj_homem_loja.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Olha, se não dá por ela;perdia-a de uma vez.";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 1:
			counter++;
			obj_player.sprite_index = spr_player_shy;
			if(!audio_played){
				audio_play_sound(snd_vine_boom, 0, false);
				audio_played = true;
			}
			if(counter >= segundos){
				obj_player.sprite_index = spr_player_idle;
				counter = 0;
				audio_played = false;
				++currentStep;
			}
			break;
		case 2:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "É verdade.";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 3:
			counter++;
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.my_sprite = spr_money;
			}
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Para avaliar a oportunidade desta carteira, é preciso saber que Honório tem de pagar amanhã uma dívida, quatrocentos e tantos mil-réis, e a carteira trazia o bojo recheado";
			}
			if(counter == segundos * 2){
				if(!audio_played){
					audio_play_sound(snd_money, 0, false);
					audio_played = true;
				}
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				counter = 0;
				audio_played = false;
				++currentStep;
			}
			break;
		case 4:
			obj_player.PlayerCanMove = true;
			room_goto(rm_2);
			instance_destroy();
			break;
	}
} 