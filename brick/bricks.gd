extends Node2D
class_name BrickRowManager


const brick_row_scene = preload("res://brick/brick_row.tscn")

var rng = RandomNumberGenerator.new()
var rows = {}


func _ready():
	print("test")
	#var _new_birck_row = brick_row_scene.instantiate()
	#_new_birck_row.position.y = 48
	#_new_birck_row.add_brick(0)
	#_new_birck_row.add_brick(2)
	#_new_birck_row.add_brick(16)
	#_new_birck_row.add_brick(32)
	#add_child(_new_birck_row)
	add_row()


func add_row():
	rng.randomize()
	var _new_brick_row = brick_row_scene.instantiate()
	_new_brick_row.position.y = 48  # It will be hidden at the start under the upper edge
	var _space_needed: bool = false  # if true, loop should skip over creating such a brick
	for _brick_x_pos in range(0, 33):
		if _space_needed:
			_space_needed = false
		elif rng.randi() % 2 == 0:
			_new_brick_row.add_brick(_brick_x_pos)
			_space_needed = true
	add_child(_new_brick_row)
