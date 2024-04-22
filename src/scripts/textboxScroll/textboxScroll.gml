//argument1==apply_nl
function textboxScroll(v) {
	var nlPos;
	nlPos = string_pos("\n", textContent);
	if (nlPos != 0) textContent = string_copy(textContent, nlPos+1, 256);
	if (v) textContent += " \n";
}