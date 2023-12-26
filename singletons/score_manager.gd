extends Node


var current_score: int = 0


func reset_score():
	current_score = 0

func add_score(_amount: int):
	current_score += _amount
	print("current score ", current_score)
