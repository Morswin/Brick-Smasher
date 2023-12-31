extends Node2D
class_name BrickRow


@export var pos_first := 64.0  # pos 0
@export var pos_change := 32.0
@export var pos_last := 1088.0  # pos 32
@export var falling_speed = 4  # about half of brick height

const brick_scene = preload("res://brick/brick.tscn")

var brick_list := []
var is_lowering := false

@onready var timer := $lowering_timer


func _process(delta):
	# It maight be better to limit how ofthen this checks, in case of performence issues
	if is_lowering:
		position.y += falling_speed * delta
	if !any_bricks_remaining():
		#print("Deleting a row because it's empty")
		BrickSharedData.current_rows -= 1
		SoundManager.play_sound(SoundPreload.SFX_LINE_CLEARED)
		queue_free()

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
	brick_list.append(_new_brick)

func any_bricks_remaining() -> bool:
	# True if any brick is still not freed from the queue
	var _any := false
	for _brick in brick_list:
		if is_instance_valid(_brick):
			_any = true
	return _any

func start_lowering():
	is_lowering = true
	timer.start()

func _on_lowering_timer_timeout():
	is_lowering = false
