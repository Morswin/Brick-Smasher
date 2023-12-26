extends CharacterBody2D
class_name Brick


@export var endurace: int = 1
@export var value: int = 100

var ID = null

@onready var sprite := $RedBrick


func lower_endurance():
	endurace -= 1
	if endurace < 1:
		destory_self()

func destory_self():
	ScoreManager.add_score(value)
	queue_free()
