currentStep = 0;
counter = 0;
segundos = game_get_speed(gamespeed_fps);

enum cutSceneStates {
	Active,
	Paused
}

currentState = cutSceneStates.Active;

obj_player.PlayerCanMove = false;

audio_played = false;

cT = obj_cutscene_text;
tB = obj_thinking_balloon;
dB = obj_dialog_box;
sB = obj_speech_balloon;

if (!audio_is_playing(snd_music)) {
        audio_play_sound(snd_music, 1, true);
}