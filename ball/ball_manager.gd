extends Node2D


var list_of_balls: Dictionary = {}

const ball_scene := preload("res://ball/ball.tscn")

@onready var deflector := $"../deflector"


func _ready():
	var _new_ball = ball_scene.instantiate()
	_new_ball.position = Vector2(64, 64)
	add_child(_new_ball)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Click")
	if len(list_of_balls.keys()) == 0:
		pass  # Initiate 1 ball and attatch it to deflector
