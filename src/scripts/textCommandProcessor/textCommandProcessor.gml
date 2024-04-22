function textCommandProcessor(){
	for (trigger=0; trigger<1; trigger+=1){
	    typeIndexStart = typeIndex;
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == " "){
	        if (prewrapOn) textboxPrewrap();
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "|"){
	        typeIndex += 1;
	        delay += 30;
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == ">"){
	        typeIndex += 1;
	        delay = 1;
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "@"){
	        textContent = "";
	        typeIndex += 1;
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "{"){
	        typeIndex += 1; soundEnabled=0;
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "}"){
	        typeIndex += 1; soundEnabled=1;
	    }
	    /*if (typeIndex>0 && string_char_at(t_text, typeIndex) == "~"){
	        textboxScroll(true);
	        typeIndex += 1;
	    }*/
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "<"){
	        typeIndex += 1;
	        waitInput = 1;
	        textboxContinueProcessing = 0;
	        break;
	    }
	    if (typeIndex>0 && string_char_at(t_text, typeIndex) == "\\"){
	        typeIndex += 4;
	        if (string_char_at(t_text, typeIndex-3) == "m"){
				audio_play_sound(asset_get_index("SFXGeneral" + string(unhex(string_copy(t_text, typeIndex-2, 2)))), 1, 0);
	        }else if (string_char_at(t_text, typeIndex-3) == "x"){
	            textContent += chr(unhex(string_copy(t_text, typeIndex-2, 2)));
	        }else if (string_char_at(t_text, typeIndex-3) == "p"){
	            t_portrait[1] = unhex(string_copy(t_text, typeIndex-2, 2));
	        }else if (string_char_at(t_text, typeIndex-3) == "d"){
	            delay = unhex(string_copy(t_text, typeIndex-2, 2));
	        }else if (string_char_at(t_text, typeIndex-3) == "f"){
				hang = true;
	        }else if (string_char_at(t_text, typeIndex-3) == "c"){
	            currentModifier = chr(unhex(string_copy(t_text, typeIndex-2, 2)));
	        }else if (string_char_at(t_text, typeIndex-3) == "s"){
	            global.textSignal = unhex(string_copy(t_text, typeIndex-2, 2));
	        }
	    }
	    if (typeIndex != typeIndexStart){
	        trigger -= 1;
	        continue;
	    }
	}
}