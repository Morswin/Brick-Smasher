extends Node2D
class_name BrickRow


const brick_scene = preload("res://brick/brick.tscn")

var center = 576  # This is where brick row's x should be set up to

@export var pos_first := 64.0  # pos 0
@export var pos_change := 32.0
@export var pos_last := 1088.0  # pos 32


func add_brick(_x: int) -> void:
	# _x Value between 0 and 32
	var _brick_pos: float
	if _x < 0:
		_brick_pos = pos_first
	elif _x > 32:
		_brick_pos = pos_last
	else:
		_brick_pos = (_x * pos_change) + pos_first
	var _new_brick = brick_scene.instantiate()
	_new_brick.position.x = _brick_pos
	add_child(_new_brick)
