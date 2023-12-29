extends CharacterBody2D
class_name Brick


@export var endurace: int = 1
@export var value: int = 100

@onready var sprite := $RedBrick


func lower_endurance():
	endurace -= 1
	if endurace < 1:
		destory_self()
		SoundManager.play_sound(SoundPreload.SFX_BRICK_DESTROYED)
	else:
		SoundManager.play_sound(SoundPreload.SFX_BRICK_LOWER_ENDURANCE)

func destory_self():
	ScoreManager.add_score(value)
	queue_free()
