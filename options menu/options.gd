extends Control


var main_menu = preload("res://main menu/main_menu.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_packed(main_menu)
