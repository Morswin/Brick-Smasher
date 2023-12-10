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


func bounce_off():
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
