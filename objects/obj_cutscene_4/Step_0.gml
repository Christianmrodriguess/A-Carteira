if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_player.sprite_index = spr_player_left_idle;
			obj_gustavo.sprite_index = spr_gustavo_right_idle;
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_gustavo.x, obj_gustavo.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Tu agora vais bem, não?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 1:
			obj_gustavo.sprite_index = spr_gustavo_idle;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "dizia-lhe ultimamente o Gustavo C..., advogado e familiar da casa";
			}		
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 2:
			obj_gustavo.sprite_index = spr_gustavo_right_idle;
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Agora vou";
			}
			if(!audio_played){
				audio_play_sound(snd_amogus, 0, false);
				audio_played = true;
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				audio_played = false;
				++currentStep;
			}
			break;
		case 3:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "A verdade é que ia mal. Poucas causas, de pequena monta, e constituintes remissos; por desgraça perdera ultimamente um processo, com que fundara grandes esperanças";
			}		
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 4:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "D. Amélia não sabia nada; ele não contava nada à mulher, bons ou maus negócios. Não contava nada a ninguém. Fingia-se tão alegre como se nadasse em um mar de prosperidades";
			}
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.my_sprite = spr_nao_grita;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 5:
			counter++
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Quando o Gustavo, que ia todas as noites à casa dele, dizia uma ou duas pilhérias, ele respondia com três e quatro; e depois ia ouvir os trechos de música alemã, que D. Amélia tocava muito bem ao piano";
			}
			if(counter >= segundos * 4 && counter <= segundos * 6.17){
				if(!instance_exists(sB)){
					sB = instance_create_layer(obj_gustavo.x + 150, obj_gustavo.y -150, "Dialogues", obj_speech_balloon);
					sB.my_sprite = spr_blank;
					instance_create_layer(sB.x, sB.y, "Dialogues_1", obj_goat_talking)
					if(!audio_played){
						audio_play_sound(snd_goat_talking1, 0, false);
						audio_played = true;
					}
				}
			}
			if(counter >= segundos * 6.17 && counter <= segundos * 6.20){
				instance_destroy(obj_goat_talking);
				instance_destroy(obj_speech_balloon);
				audio_played = false;
			}
			if(counter >= segundos * 6.20 && counter <= segundos * 8.20){
				if(!instance_exists(sB)){
					sB = instance_create_layer(obj_player.x + 150, obj_player.y -150, "Dialogues", obj_speech_balloon);
					sB.my_sprite = spr_blank;
					instance_create_layer(sB.x, sB.y, "Dialogues_1", obj_goat_talking);
				}
				if(!audio_played){
					audio_play_sound(snd_goat_talking2, 0, false);
					audio_played = true;
				}
			}
			if(counter >= segundos * 8.20 && counter <= segundos * 10){
				instance_destroy(obj_goat_talking);
				instance_destroy(obj_speech_balloon);
				audio_played = false;
			}
			if(counter >= segundos * 10 && counter <= segundos * 23.37){
				obj_player.sprite_index = spr_player_right_idle;
				obj_amelia.sprite_index = spr_amelia_up;
				obj_amelia.image_index = 0;
				obj_amelia.image_speed = 0;
				if(!audio_played){
					audio_play_sound(snd_german_song, 0, false);
					audio_played = true;
				}
			}
			if(counter >= segundos * 23.37){
				instance_destroy(obj_cutscene_text);
				counter = 0;
				audio_played = false;
				++currentStep;
			}
			break;
		case 6:
			obj_player.sprite_index = spr_player_idle;
			obj_gustavo.sprite_index = spr_gustavo_idle;
			obj_amelia.sprite_index = spr_amelia_idle;
			obj_amelia.image_speed = 1;
			obj_player.PlayerCanMove = true;
			room_goto(rm_5);
			instance_destroy();
			break;
	}
}