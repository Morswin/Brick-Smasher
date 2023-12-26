extends Node2D
class_name BrickRowManager


const brick_row_scene = preload("res://brick/brick_row.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")
	var _new_birck_row = brick_row_scene.instantiate()
	_new_birck_row.position.y = 48
	_new_birck_row.add_brick(0)
	_new_birck_row.add_brick(1)
	_new_birck_row.add_brick(16)
	_new_birck_row.add_brick(32)
	add_child(_new_birck_row)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
