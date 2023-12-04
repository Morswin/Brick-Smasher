extends CharacterBody2D
class_name Ball


const SPEED = 150

var direction = Vector2(1, -1)


func _ready():
	up_direction = Vector2(0, -1)


func _physics_process(_delta):
	if is_on_ceiling():
		direction.y = direction.y * -1
	if is_on_wall():
		direction.x = direction.x * -1
	velocity = direction * SPEED 
	move_and_slide()
