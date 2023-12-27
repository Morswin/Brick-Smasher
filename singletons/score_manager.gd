extends Node


var current_score: int = 0
var score_label = null


func _process(_delta):
	if score_label:
		score_label.text = "Score: " + str(current_score)

func reset_score():
	current_score = 0

func set_score_label(label):
	score_label = label

func add_score(_amount: int):
	current_score += _amount
