draw_self();
draw_set_font(fnt_dialog);
draw_set_color(c_black);
draw_text_ext(bbox_left + 4, bbox_top + 2, partial_text, 16, sprite_width - 16);

if(text_completed){
	draw_set_font(fnt_press_space);
	draw_set_color(c_dkgray);
	draw_text_ext(bbox_right - 80, bbox_bottom - 16, "press espaco", 8, sprite_width - 8);
}