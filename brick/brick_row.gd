extends Node2D
class_name BrickRow


@export var pos_first := 64.0  # pos 0
@export var pos_change := 32.0
@export var pos_last := 1088.0  # pos 32
@export var falling_speed = 4  # about half of brick height

const brick_scene = preload("res://brick/brick.tscn")

var center = 576  # This is where brick row's x should be set up to
var ID = null
var next_brick_ID = 0
var brick_dict = {}
var is_lowering: bool = false

@onready var timer := $lowering_timer


func _process(delta):
	# It maight be better to limit how ofthen this checks, in case of performence issues
	if is_lowering:
		position.y += falling_speed * delta
	if !any_bricks_remaining():
		#print("Deleting a row because it's empty")
		BrickSharedData.current_rows -= 1
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
	_new_brick.ID = get_next_brick_ID()
	add_child(_new_brick)
	brick_dict[_new_brick.ID] = _new_brick

func get_next_brick_ID():
	next_brick_ID += 1
	return next_brick_ID - 1

func any_bricks_remaining() -> bool:
	# True if any brick is still not freed from the queue
	var _any := false
	for key in brick_dict.keys():
		if is_instance_valid(brick_dict[key]):
			_any = true
	return _any

func start_lowering():
	is_lowering = true
	timer.start()

func _on_lowering_timer_timeout():
	is_lowering = false
