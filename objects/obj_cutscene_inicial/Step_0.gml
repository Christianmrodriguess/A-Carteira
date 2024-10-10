if(currentState == cutSceneStates.Active) {
	switch(currentStep) {
		case 0:
			if(!instance_exists(cT)){
				cT = instance_create_layer(683, 56, "Dialogues", obj_cutscene_text);
				cT.text = "...DE REPENTE, Honório olhou para o chão e viu uma carteira";
			}
			if(cT.text_completed && keyboard_check_pressed(vk_space)){
				instance_destroy(obj_cutscene_text);
				++currentStep;
			}
			break;
		case 1:
			obj_player.PlayerCanMove = true;
			instance_destroy();
			break;
	}
}