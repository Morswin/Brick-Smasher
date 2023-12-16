extends CharacterBody2D
class_name Ball


@onready var sprite := $DefaulBall

const SPEED = 150

var ID: int

@export var direction := Vector2(1, -0.75)
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

#
#func bounce_off(_brick_pos: Vector2, _brick_size: Vector2):
	## Calculate Ball's size
	#var _brick_edge_top: int = (_brick_pos.y - (_brick_size.y / 2)) as int
	#var _brick_edge_bottom: int =( _brick_pos.y + (_brick_size.y / 2)) as int
	#var _brick_edge_left: int = (_brick_pos.x - (_brick_size.x / 2)) as int
	#var _brick_edge_right: int = (_brick_pos.x + (_brick_size.x / 2)) as int
	#var _ball_size := Vector2(
		#sprite.get_rect().size.x * sprite.scale.x,
		#sprite.get_rect().size.y * sprite.scale.y
	#)
	#var _ball_edge_top: int = (global_position.y - (_ball_size.y / 2)) as int
	#var _ball_edge_bottom: int = (global_position.y + (_ball_size.y / 2)) as int
	#var _ball_edge_left: int = (global_position.x - (_ball_size.x / 2)) as int
	#var _ball_edge_right: int = (global_position.x + (_ball_size.x / 2)) as int
	#print(direction.angle())
	#print(PI/4)
	#print((PI/4)*3)
	#if direction.angle() <= PI/4 and direction.angle() >= -PI/4:
		#print("Reflect after right")
		## Ball is moving right
		## Calculating edges
		##var _brick_edge_top: int = (_brick_pos.y - (_brick_size.y / 2)) as int
		##var _brick_edge_bottom: int =( _brick_pos.y + (_brick_size.y / 2)) as int
		##var _ball_edge_top: int = (global_position.y - (_ball_size.y / 2)) as int
		##var _ball_edge_bottom: int = (global_position.y + (_ball_size.y / 2)) as int
		## Ball is between brick's edges
		#var _condition_1: bool = (_ball_edge_top >= _brick_edge_top) and (_ball_edge_bottom <= _brick_edge_bottom)
		## Ball is still below brick's upper edge
		#var _condition_2: bool = (_ball_edge_bottom >= _brick_edge_top)
		## Ball is still above brick's lower edge
		#var _condition_3: bool = (_ball_edge_top <= _brick_edge_bottom)
		#if _condition_1 or _condition_2 or _condition_3:
			#direction.x = -abs(direction.x)
	#elif direction.angle() <= -PI/4 and direction.angle() > -(PI/4)*3:
		#print("Reflect after up")
		## Ball is moving up
		## Calculating edges
		##var _brick_edge_left: int = (_brick_pos.x - (_brick_size.x / 2)) as int
		##var _brick_edge_right: int = (_brick_pos.x + (_brick_size.x / 2)) as int
		##var _ball_edge_left: int = (global_position.x - (_ball_size.x / 2)) as int
		##var _ball_edge_right: int = (global_position.x + (_ball_size.x / 2)) as int
		## Ball is between brick's edges
		#var _condition_1: bool = (_ball_edge_left >= _brick_edge_left) and (_ball_edge_right <= _brick_edge_right)
		## Ball touches brick's left edge
		#var _condition_2: bool = (_ball_edge_right >= _brick_edge_left)
		## Ball touches brick's right edge 
		#var _condition_3: bool = (_ball_edge_left <= _brick_edge_right)
		#if _condition_1 or _condition_2 or _condition_3:
			#direction.y = abs(direction.y)
	#elif direction.angle() >= PI/4 and direction.angle() < (PI/4)*3:
		#print("Reflect after down")
		## Ball is moving down
		## Calculating edges
		##var _brick_edge_left: int = (_brick_pos.x - (_brick_size.x / 2)) as int
		##var _brick_edge_right: int = (_brick_pos.x + (_brick_size.x / 2)) as int
		##var _ball_edge_left: int = (global_position.x - (_ball_size.x / 2)) as int
		##var _ball_edge_right: int = (global_position.x + (_ball_size.x / 2)) as int
		## Ball is between brick's edges
		#var _condition_1: bool = (_ball_edge_left >= _brick_edge_left) and (_ball_edge_right <= _brick_edge_right)
		## Ball touches brick's left edge
		#var _condition_2: bool = (_ball_edge_right >= _brick_edge_left)
		## Ball touches brick's right edge 
		#var _condition_3: bool = (_ball_edge_left <= _brick_edge_right)
		#if _condition_1 or _condition_2 or _condition_3:
			#direction.y = -abs(direction.y)
	#else:
		#print("Reflect after left")
		## Ball is moving left
		## Calculating edges
		##var _brick_edge_top: int = (_brick_pos.y - (_brick_size.y / 2)) as int
		##var _brick_edge_bottom: int =( _brick_pos.y + (_brick_size.y / 2)) as int
		##var _ball_edge_top: int = (global_position.y - (_ball_size.y / 2)) as int
		##var _ball_edge_bottom: int = (global_position.y + (_ball_size.y / 2)) as int
		## Ball is between brick's edges
		#var _condition_1: bool = (_ball_edge_top >= _brick_edge_top) and (_ball_edge_bottom <= _brick_edge_bottom)
		## Ball is still below brick's upper edge
		#var _condition_2: bool = (_ball_edge_bottom >= _brick_edge_top)
		## Ball is still above brick's lower edge
		#var _condition_3: bool = (_ball_edge_top <= _brick_edge_bottom)
		#if _condition_1 or _condition_2 or _condition_3:
			#direction.x = abs(direction.x)
