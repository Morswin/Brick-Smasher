extends CharacterBody2D
class_name Deflector


enum hloding_ball {
	holding,
	not_holding,
	game_just_started
}


const SPEED = 300.0

var holding_ball_state := hloding_ball.game_just_started


func _ready():
	pass


func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
