extends Node2D
class_name BrickRowManager


const brick_row_scene = preload("res://brick/brick_row.tscn")

var rng = RandomNumberGenerator.new()
var rows = {}  # in case of need to filter over them
var next_id = 0


func _ready():
	add_row()

func add_row():
	rng.randomize()
	var _new_brick_row = brick_row_scene.instantiate()
	_new_brick_row.position.y = 16  # It will be hidden at the start under the upper edge
	var _space_needed: bool = false  # if true, loop should skip over creating such a brick
	for _brick_x_pos in range(0, 33):
		if _space_needed:
			_space_needed = false
		elif rng.randi() % 2 == 0:
			_new_brick_row.add_brick(_brick_x_pos)
			_space_needed = true
	_new_brick_row.ID = get_next_row_ID()
	add_child(_new_brick_row)
	rows[_new_brick_row.ID] = _new_brick_row

func get_next_row_ID():
	# The only intended way for getting the next ID
	next_id += 1
	return next_id - 1
