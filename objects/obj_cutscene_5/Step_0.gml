if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_player.sprite_index = spr_player_left_idle;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Um dia, a mulher foi achá-lo dando muitos beijos à filha, criança de quatro anos, e viu-lhe os olhos molhados; ficou espantada, e perguntou-lhe o que era";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				obj_player.sprite_index = spr_player_sad;
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 1:
			obj_amelia.sprite_index = spr_amelia_left;
			if(obj_amelia.x != 590){
				--obj_amelia.x;	
			} else {
				obj_amelia.sprite_index = spr_amelia_left_idle;
				++currentStep;
			}
			break;
		case 2:
			obj_player.sprite_index = spr_player_right_idle;
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_amelia.x + 100, obj_amelia.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "O que foi?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 3:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Nada, nada";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 4:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Compreende-se que era o medo do futuro e o horror da miséria. Mas as esperanças voltavam com facilidade. A idéia de que os dias melhores tinham de vir dava-lhe conforto para a luta";
			}
			if(counter >= segundos * 2){
				obj_player.sprite_index = spr_player_sad;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				counter = 0;
				++currentStep;
			}
			break;
		case 5:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Estava com, trinta e quatro anos; era o princípio da carreira: todos os princípios são difíceis. E toca a trabalhar, a esperar, a gastar, pedir fiado ou: emprestado, para pagar mal, e a más horas";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 6:
			obj_player.PlayerCanMove = true;
			obj_player.sprite_index = spr_player_idle;
			room_goto(rm_6);
			instance_destroy();
			break;
	}
}