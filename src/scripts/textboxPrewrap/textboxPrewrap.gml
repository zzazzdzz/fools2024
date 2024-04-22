function textboxPrewrap() {
	var nextWord, nextFollow;
	nextFollow = string_copy(t_text, typeIndex+1, 999);
	nextWord = string_copy(nextFollow, 1, string_pos(" ", nextFollow));
	if (nextWord == "") nextWord = nextFollow;

	draw_set_font(TextboxFont);
	if (string_width(textContent + " " + nextWord) > (t_w-2*sw - safetyMargin)){
	    textContent += "\n";
	    typeIndex += 1;
	}
}