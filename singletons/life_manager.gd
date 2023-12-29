extends Node


@export var starting_lifes: int = 3

var current_lifes: int = 3


func reset_life_count():
	current_lifes = starting_lifes

func decrease_life_count():
	current_lifes -= 1
	SoundManager.play_sound(SoundPreload.SFX_LIFE_LOST)
	if current_lifes <= 0:
		ScoreManager.score_label = null
		get_tree().call_deferred("change_scene_to_file", "res://main menu/main_menu.tscn")
