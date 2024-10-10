if(i < string_length(text)) {
	c += velocidade;

	if (c >= 1 && i < string_length(text)) {
		partial_text += string_char_at(text, i + 1);
		i += 1;
		c = 0;
		audio_play_sound(snd_typing2, 1, false);
	}	
} else {
	text_completed = true;
}