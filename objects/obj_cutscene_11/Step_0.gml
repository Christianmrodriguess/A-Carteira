if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			obj_gustavo.sprite_index = spr_gustavo_right_idle;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Chegando a casa, já ali achou o Gustavo, um pouco preocupado e a própria D. Amélia o parecia também. Entrou rindo, e perguntou ao amigo se lhe faltava alguma cousa";
			}
			if(obj_player.y != 512){
				obj_player.sprite_index = spr_player_up;
				--obj_player.y;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 1:
			if(obj_player.x != 416){
				obj_player.sprite_index = spr_player_left;
				--obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_left_idle;
				if(cT.text_completed && keyboard_check_pressed(vk_space)){
					instance_destroy(obj_cutscene_text);
					++currentStep;
				}
			}
			break;
		case 2:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Lhe falta algo?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 3:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_gustavo.x , obj_gustavo.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Nada";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 4:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Nada?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 5:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_gustavo.x , obj_gustavo.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Por quê?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 6:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Mete a mão no bolso; não te falta nada?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 7:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_gustavo.x , obj_gustavo.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Falta-me a carteira, sabes se alguém a achou?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 8:
			counter++;
			obj_player.sprite_index = spr_player_left_carteira;
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Achei-a eu";
			}
			if(counter >= segundos * 2){
				instance_destroy(obj_dialog_box);
				counter = 0;
				++currentStep;
			}
			break;
		case 9:
			if(obj_gustavo.x != 256){
				obj_gustavo.sprite_index = spr_gustavo_right;
				++obj_gustavo.x
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 10:
			if(obj_gustavo.y != 480){
				obj_gustavo.sprite_index = spr_gustavo_up;
				--obj_gustavo.y
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 11:
			if(obj_gustavo.x != 352){
				obj_gustavo.sprite_index = spr_gustavo_right;
				++obj_gustavo.x
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 12:
			obj_player.sprite_index = spr_player_left_idle;
			if(obj_gustavo.x != 256){
				obj_gustavo.sprite_index = spr_gustavo_left;
				--obj_gustavo.x
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 13:
			if(obj_gustavo.y != 512){
				obj_gustavo.sprite_index = spr_gustavo_down;
				++obj_gustavo.y
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 14:
			if(obj_gustavo.x != 224){
				obj_gustavo.sprite_index = spr_gustavo_left;
				--obj_gustavo.x
			} else {
				obj_gustavo.sprite_index = spr_gustavo_right_idle;
				++currentStep;
			}
			break;
		case 15:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Gustavo pegou dela precipitadamente, e olhou desconfiado para o amigo. Esse olhar foi para Honório como um golpe de estilete; depois de tanta luta com a necessidade, era um triste prêmio";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 16:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_gustavo.x , obj_gustavo.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Mas conheceste-a?";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 17:
			if(!instance_exists(dB)){
				dB = instance_create_layer(obj_player.x + 100, obj_player.y - 100, "Dialogues", obj_dialog_box);
				dB.text = "Não, achei os teus bilhetes de visita";
			}
			if(keyboard_check_pressed(vk_space)){
				instance_destroy(obj_dialog_box);
				++currentStep;
			}
			break;
		case 18:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Honório deu duas voltas, e foi mudar de toilette para o jantar";
			}
			if(obj_player.x != 448){
				obj_player.sprite_index = spr_player_right;
				++obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 19:
			if(obj_player.y != 128){
				obj_player.sprite_index = spr_player_up;
				--obj_player.y;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 20:
			if(obj_player.x != 128){
				obj_player.sprite_index = spr_player_left;
				--obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				instance_destroy(obj_cutscene_text);
				instance_destroy(obj_player);
				++currentStep;
			}
			break;
		case 21:
			if(obj_gustavo.x != 256){
				obj_gustavo.sprite_index = spr_gustavo_right;
				++obj_gustavo.x;
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 22:
			if(obj_gustavo.y != 448){
				obj_gustavo.sprite_index = spr_gustavo_up;
				--obj_gustavo.y;
			} else {
				obj_gustavo.sprite_index = spr_gustavo_idle;
				++currentStep;
			}
			break;
		case 23:
			if(obj_gustavo.x != 704){
				obj_gustavo.sprite_index = spr_gustavo_right;
				++obj_gustavo.x;
			} else {
				obj_gustavo.sprite_index = spr_gustavo_carteira_right;
				obj_amelia.sprite_index = spr_amelia_left_idle;
				++currentStep;
			}
			break;
		case 24:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Então Gustavo sacou novamente a carteira, abriu-a, foi a um dos bolsos, tirou um dos bilhetinhos, que o outro não quis abrir nem ler, e estendeu-o a D. Amélia";
			}
			if(counter >= segundos * 4 && counter <= segundos * 5){
				obj_gustavo.sprite_index = spr_gustavo_bilhete_right;
			}
			if(counter >= segundos * 5 && counter <= segundos * 6){
				obj_gustavo.sprite_index = spr_gustavo_right_idle;
				obj_amelia.sprite_index = spr_amelia_bilhete_left;
			}
			if(counter >= segundos * 6){
				if(cT.text_completed && keyboard_check_pressed(vk_space)){
					instance_destroy(obj_cutscene_text);
					counter = 0;
					++currentStep;
				}
			}
			break;
		case 25:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "D. Amélia, ansiosa e trêmula, rasgou-o em trinta mil pedaços: era um bilhetinho de amor.";
				obj_amelia.sprite_index = spr_amelia_bilhete_rasgado;
			}
			if(counter >= segundos * 2){
				obj_amelia.sprite_index = spr_amelia_left_idle;
				if(cT.text_completed && keyboard_check_pressed(vk_space)){
					instance_destroy(obj_cutscene_text);
					counter = 0;
					++currentStep;
				}
			}
			break;
		case 26:
			room_goto(rm_fim);
			instance_destroy();
			break;
	}
}