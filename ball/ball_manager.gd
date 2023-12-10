extends Node2D


const BALL_SCENE := preload("res://ball/ball.tscn")

@onready var deflector := $"../deflector"


func _ready():
	var _new_ball = BALL_SCENE.instantiate()
	_new_ball.position = Vector2(64, 64)
	_new_ball.attached = true
	add_child(_new_ball)
