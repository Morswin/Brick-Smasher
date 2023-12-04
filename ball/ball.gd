extends RigidBody2D
class_name Ball


const SPEED = 150


func _ready():
	linear_velocity = Vector2(1, -1) * SPEED


func _process(delta):
	pass
