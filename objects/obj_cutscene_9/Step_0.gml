if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			if(obj_player.y != 576){
				obj_player.sprite_index = spr_player_up;
				--obj_player.y;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 1:
			if(obj_player.x != 1184){
				obj_player.sprite_index = spr_player_right;
				++obj_player.x;
			} else {
				obj_player.sprite_index = spr_player_idle;
				++currentStep;
			}
			break;
		case 2:
			obj_player.sprite_index = spr_player_left_idle;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Encostou-se à parede, Tinha medo de abrir a carteira; podia não achar nada, apenas papéis e sem valor para ele. Ao mesmo tempo, e esta era a causa principal das reflexões, a consciência perguntava-lhe se podia utilizar-se do dinheiro que achasse";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 3:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Podia lançar mão do dinheiro, e ir pagar com ele a dívida? Eis o ponto. A consciência acabou por lhe dizer que não podia, que devia levar a carteira à polícia, ou anunciá-la";
			}
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.image_xscale = 1;
				tB.my_sprite = spr_angel;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 4:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Mas tão depressa acabava de lhe dizer isto, vinham os apuros da ocasião e chegavam a dizer-lhe que, se fosse ele que a tivesse perdido, ninguém iria entregar-lha; insinuação que lhe deu ânimo";
			}
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x - 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.image_xscale = -1;
				tB.my_sprite = spr_devil;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				tB.image_xscale = 1;
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				counter = 0;
				++currentStep;
			}
			break;
		case 5:
			obj_player.sprite_index = spr_player_left_carteira;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Tudo isso antes de abrir a carteira. Tirou-a do bolso, finalmente, mas com medo, quase às escondidas";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 6:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Abriu-a, e ficou trêmulo. Tinha dinheiro, muito dinheiro, calculou uns setecentos mil réis ou mais. Era a dívida paga; eram menos algumas despesas urgentes";
			}
			obj_player.sprite_index = spr_player_shy;
			if(!audio_played){
				audio_play_sound(snd_vine_boom, 0, false);
				audio_played = true;
			}
			if(counter >= segundos){
				obj_player.sprite_index = spr_player_left_carteira;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				audio_played = false;
				++currentStep;
			}
			break;
		case 7:
			obj_player.sprite_index = spr_player_left_idle;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Fechou a carteira, e com medo de a perder, tornou a guardá-la";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 8:
			obj_player.sprite_index = spr_player_left_carteira;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Mas daí a pouco tirou-a outra vez, e abriu-a, com vontade de contar o dinheiro. Contar para quê? era dele? Afinal venceu-se e contou: eram setecentos e trinta mil-réis";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 9:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Tratou de ver se havia na carteira algum sinal. \"Se houver um nome, uma indicação qualquer, não posso utilizar- me do dinheiro,\" pensou ele";
			}
			if(!instance_exists(tB)){
				tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
				tB.my_sprite = spr_card;
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 10:
			counter++;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Esquadrinhou os bolsos da carteira. Achou cartas, que não abriu, bilhetinhos dobrados, que não leu, e por fim um cartão de visita; leu o nome; era do Gustavo. Mas então, a carteira?...";
			}
			if(counter >= segundos * 7){
				if(!instance_exists(tB)){
					tB = instance_create_layer(obj_player.x + 75, obj_player.y -150, "Dialogues", obj_thinking_balloon);
					tB.my_sprite = spr_gustavo_idle;
				}
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_thinking_balloon);
				instance_destroy(obj_cutscene_text);
				counter = 0;
				++currentStep;
			}
			break;
		case 11:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "Examinou-a por fora, e pareceu-lhe efetivamente do amigo. Voltou ao interior; achou mais dois cartões, mais três, mais cinco. Não havia duvidar; era dele";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 12:
			obj_player.sprite_index = spr_player_sad;
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "A descoberta entristeceu-o. Não podia ficar com o dinheiro, sem praticar um ato ilícito, e, naquele caso, doloroso ao seu coração porque era em dano de um amigo";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				counter = 0;
				++currentStep;
			}
			break;
		case 13:
			obj_player.sprite_index = spr_player_idle;
			obj_player.PlayerCanMove = true;
			room_goto(rm_10);
			instance_destroy();
			break;
	}
}