extends Area2D
class_name Brick


@onready var sprite := $RedBrick


func _on_body_entered(body):
	if body.is_in_group("Balls"):
		body.bounce_off()
		# initiate destruction of the brick or at leas lower it's endurance