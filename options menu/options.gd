extends Control


@onready var full_screen_cb := $MarginContainer/VBoxContainer/HBoxContainer/CheckBox
@onready var main_menu := load("res://main menu/main_menu.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_packed(main_menu)

func _on_check_box_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
