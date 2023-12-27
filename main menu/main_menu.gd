extends Control


@onready var game_loop := load("res://game_loop.tscn")
@onready var options_menu := load("res://options menu/options.tscn")


func _on_start_pressed():
	LifeManager.reset_life_count()
	ScoreManager.reset_score()
	get_tree().change_scene_to_packed(game_loop)

func _on_options_pressed():
	get_tree().change_scene_to_packed(options_menu)

func _on_exit_pressed():
	get_tree().quit()
