extends Node


var starting_rows := 2
var current_rows := 0


func get_difficulty() -> int:
	if ScoreManager.current_score < 1000:
		return 1
	elif ScoreManager.current_score >= 1000 and ScoreManager.current_score < 2000:
		return 2
	elif ScoreManager.current_score >= 2000 and ScoreManager.current_score < 3000:
		return 3
	elif ScoreManager.current_score >= 3000 and ScoreManager.current_score < 4500:
		return 4
	elif ScoreManager.current_score >= 4500 and ScoreManager.current_score < 6000:
		return 5
	elif ScoreManager.current_score >= 6000 and ScoreManager.current_score < 10000:
		return 6
	elif ScoreManager.current_score >= 10000 and ScoreManager.current_score < 15000:
		return 7
	elif ScoreManager.current_score >= 15000 and ScoreManager.current_score < 20000:
		return 8
	else:
		return 9

func target_amount() -> int:
	return starting_rows + get_difficulty()

func advance_or_wait() -> bool:
	if current_rows < target_amount():
		return true
	else:
		return false  # else
