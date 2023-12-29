extends Node2D


const BALL_SCENE := preload("res://ball/ball.tscn")

@onready var deflector := $"../deflector"
@onready var score_label := $"../Score"

var ball_list := []


func _ready():
	ScoreManager.set_score_label(score_label)
	var _new_ball = BALL_SCENE.instantiate()
	_new_ball.position = Vector2(64, 64)
	_new_ball.attached = true
	var _id = len(ball_list)
	_new_ball.ID = _id
	add_child(_new_ball)
	ball_list.append(_new_ball)

func _on_ball_catcher_body_entered(body):
	if body.is_in_group("Balls"):
		var _id = body.remove_or_return(len(ball_list) <= 1)
