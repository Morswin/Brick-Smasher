extends Node2D


const BALL_SCENE := preload("res://ball/ball.tscn")

@onready var deflector := $"../deflector"
@onready var score_label := $"../Score"

var ball_dict: Dictionary = {}

func _ready():
	ScoreManager.set_score_label(score_label)
	var _new_ball = BALL_SCENE.instantiate()
	_new_ball.position = Vector2(64, 64)
	_new_ball.attached = true
	var _id = len(ball_dict.keys())
	_new_ball.ID = _id
	add_child(_new_ball)
	ball_dict[_id] = _new_ball


func _on_ball_catcher_body_entered(body):
	print(body)
	if body.is_in_group("Balls"):
		var _id = body.remove_or_return(len(ball_dict.keys()) <= 1)
