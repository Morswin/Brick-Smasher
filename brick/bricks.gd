extends Node2D
class_name BrickRowManager


const brick_row_scene = preload("res://brick/brick_row.tscn")

var rng = RandomNumberGenerator.new()
var rows := []  # in case of need to filter over them

# Used for tracking whether to play lvl up sound
@onready var previous_lvl = BrickSharedData.get_difficulty()  


func _ready():
	add_row(16)  # The second, already present but hidden row
	add_row(48)  # The first visible row
	BrickSharedData.current_rows = 2

func _process(_delta):
	if BrickSharedData.get_difficulty() != previous_lvl:
		SoundManager.play_sound(SoundPreload.SFX_LEVEL_UP)
		previous_lvl = BrickSharedData.get_difficulty()

func add_row(start_y: int = -16):
	rng.randomize()
	var _new_brick_row = brick_row_scene.instantiate()
	_new_brick_row.position.y = start_y  # It will be hidden at the start under the upper edge
	var _space_needed: bool = false  # if true, loop should skip over creating such a brick
	for _brick_x_pos in range(0, 33):
		if _space_needed:
			_space_needed = false
		elif rng.randi() % 2 == 0:
			_new_brick_row.add_brick(_brick_x_pos)
			_space_needed = true
	
	add_child(_new_brick_row)
	rows.append(_new_brick_row)
	BrickSharedData.current_rows += 1

func _on_brick_spawn_timer_timeout():
	if BrickSharedData.advance_or_wait():
		add_row()
		for _row in rows:
			if is_instance_valid(_row):
				_row.start_lowering()
