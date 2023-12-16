extends CharacterBody2D
class_name Ball


const SPEED = 150

var ID: int

@export var direction := Vector2(1, -1)
@export var attached := false  # Is this ball attached to the deflector?


func _ready():
	up_direction = Vector2(0, -1)


func _physics_process(_delta):
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


func bounce_off(_brick_pos: Vector2, _brick_size: Vector2):
	print(_brick_pos, _brick_size)
	var _brick_edge_top: int = _brick_pos.y - (_brick_size.y / 2)
	var _brick_edge_bottom: int = _brick_pos.y + (_brick_size.y / 2)
	var _brick_edge_left: int = _brick_pos.x - (_brick_size.x / 2)
	var _brick_edge_right: int = _brick_pos.x + (_brick_size.x / 2)
	print(_brick_edge_top)
	print(_brick_edge_bottom)
	print(_brick_edge_left)
	print(_brick_edge_right)
	if direction.angle() <= PI/4 and direction.angle() >= -PI/4:
		# Ball is moving right
		direction.x = -abs(direction.x)
	elif direction.angle() <= -PI/4 and direction.angle() > -(PI/4)*3:
		# Ball is moving up
		direction.y = abs(direction.y)
	elif direction.angle() >= PI/4 and direction.angle() < (PI/4)*3:
		# Ball is moving down
		direction.y = -abs(direction.y)
	else:
		# Ball is moving left
		direction.x = abs(direction.x)
