extends Control


var game_loop := preload("res://game_loop.tscn")


func _on_start_pressed():
	LifeManager.reset_life_count()
	ScoreManager.reset_score()
	get_tree().change_scene_to_packed(game_loop)


func _on_options_pressed():
	# TODO implement options menu
	print("Not implemented yet")


func _on_exit_pressed():
	get_tree().quit()
