extends Node


var starting_rows := 5 # 2
var current_rows := 0


func advance_or_wait() -> bool:
	if current_rows < starting_rows:
		return true
	else:
		return false  # else
