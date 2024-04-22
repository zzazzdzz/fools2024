if (ds_map_find_value(async_load, "status") == 0) {
	if (ds_map_find_value(async_load, "http_status") == 200) {
		htResult = string_trim(ds_map_find_value(async_load, "result"));
		if (htResult == "BIND_INVALID") htError = true;
		else if (htResult == "RANKING_DOWN") htError = true;
		else if (htResult == "INVALID_PAYLOAD") htError = true;
		else htError = false;
	} else {
		htError = true;
		htResult = "GENERAL_ERROR";
	}
} else {
	htResult = "CONN_FAILED";
	htError = true;
}
htReady = true;