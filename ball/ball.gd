extends CharacterBody2D
class_name Ball


@onready var sprite := $DefaulBall
@onready var ray_up := $ray_casts/ray_up
@onready var ray_up_2 := $ray_casts/ray_up2
@onready var ray_left := $ray_casts/ray_left
@onready var ray_left_2 := $ray_casts/ray_left2
@onready var ray_right := $ray_casts/ray_right
@onready var ray_right_2 := $ray_casts/ray_right2
@onready var ray_down := $ray_casts/ray_down
@onready var ray_down_2 := $ray_casts/ray_down2
@onready var ray_down_deflector := $ray_casts/ray_down_deflector
@onready var ray_down_deflector_2 := $ray_casts/ray_down_deflector2

const SPEED = 250

var ID: int

@export var direction := Vector2(1, -0.75)
@export var attached := false  # Is this ball attached to the deflector?


func _ready():
	up_direction = Vector2(0, -1)


func _physics_process(_delta):
	var _down_col = ray_down.get_collider()
	var _down_col_2 = ray_down_2.get_collider()
	if _down_col:
		_down_col.lower_endurance()
	elif _down_col_2:
		_down_col_2.lower_endurance()
	var _left_col = ray_left.get_collider()
	var _left_col_2 = ray_left_2.get_collider()
	if _left_col:
		_left_col.lower_endurance()
	elif _left_col_2:
		_left_col_2.lower_endurance()
	var _right_col = ray_right.get_collider()
	var _right_col_2 = ray_right_2.get_collider()
	if _right_col:
		_right_col.lower_endurance()
	elif _right_col_2:
		_right_col_2.lower_endurance()
	var _up_col = ray_up.get_collider()
	var _up_col_2 = ray_up_2.get_collider()
	if _up_col:
		_up_col.lower_endurance()
	elif _up_col_2:
		_up_col_2.lower_endurance()
	
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
			var _def_col = ray_down_deflector.get_collider()
			var _def_col_2 = ray_down_deflector_2.get_collider()
			if _def_col:
				direction = deflector_change_angle(_def_col)
			elif _def_col_2:
				direction = deflector_change_angle(_def_col_2)
			direction.y = -abs(direction.y)
		velocity = direction * SPEED 
	move_and_slide()


func remove_or_return(_reattach: bool = false):
	# TODO Add part about deleting the ball if there are more then 1 on the board.
	if _reattach:
		LifeManager.decrease_life_count()
		attached = true
	return ID


func deflector_change_angle(_deflector) -> Vector2:
	var _angle: float = _deflector.get_deflection_angle(global_position)
	var _new_direction: Vector2 = Vector2(cos(_angle), sin(_angle))
	return _new_direction
