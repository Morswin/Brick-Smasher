extends CharacterBody2D
class_name Deflector


const SPEED = 300.0

@onready var ball_holder := $BallHolder


func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = 0

	move_and_slide()
