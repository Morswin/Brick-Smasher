extends Node2D


@onready var ball_scene := load("res://ball/ball.tscn")
@onready var deflector := $"../deflector"

var list_of_balls: Dictionary = {}


func _ready():
	var _new_ball = ball_scene.instantiate()
	add_child(_new_ball)
	#var _new_ball = ball_scene.instantiate() #Ball.new(0, true)  #
	#add_child(_new_ball)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Click")
	if len(list_of_balls.keys()) == 0:
		pass  # Initiate 1 ball and attatch it to deflector
