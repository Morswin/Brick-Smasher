extends CharacterBody2D
class_name Ball


@onready var sprite := $DefaulBall
@onready var ray_up := $ray_casts/ray_up
@onready var ray_left := $ray_casts/ray_left
@onready var ray_right := $ray_casts/ray_right
@onready var ray_down := $ray_casts/ray_down

const SPEED = 150

var ID: int

@export var direction := Vector2(1, -0.75)
@export var attached := false  # Is this ball attached to the deflector?


func _ready():
	up_direction = Vector2(0, -1)


func _physics_process(_delta):
	var _down_col = ray_down.get_collider()
	if _down_col:
		print(_down_col)
		_down_col.lower_endurance()
	var _left_col = ray_left.get_collider()
	if _left_col:
		print(_left_col)
		_left_col.lower_endurance()
	var _right_col = ray_right.get_collider()
	if _right_col:
		print(_right_col)
		_right_col.lower_endurance()
	var _up_col = ray_up.get_collider()
	if _up_col:
		print(_up_col)
		_up_col.lower_endurance()
	if attached:
		position = get_parent().deflector.ball_holder.global_position
		if Input.is_action_just_pressed("ui_accept"):
			attached = false
	else:
		if is_on_ceiling():
			direction.y = direction.y * -1
		if is_on_wall():
			direction.x = direction.x * -1
		if is_on_floor():
			direction.y = direction.y * -1
		velocity = direction * SPEED 
	move_and_slide()


func remove_or_return(_reattach: bool = false):
	if _reattach:
		attached = true
	return ID
