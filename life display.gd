extends HBoxContainer
class_name LifeDisplay


@onready var sprite_life_full := load("res://graphics/life/life_full.png")
@onready var sprite_life_empty := load("res://graphics/life/life_empty.png")
@onready var con_first := $first
@onready var con_second := $second
@onready var con_third := $third


func _process(_delta):
	match LifeManager.current_lifes:
		3:
			con_first.texture = sprite_life_full
			con_second.texture = sprite_life_full
			con_third.texture = sprite_life_full
		2:
			con_first.texture = sprite_life_full
			con_second.texture = sprite_life_full
			con_third.texture = sprite_life_empty
		1:
			con_first.texture = sprite_life_full
			con_second.texture = sprite_life_empty
			con_third.texture = sprite_life_empty
		_:
			con_first.texture = sprite_life_empty
			con_second.texture = sprite_life_empty
			con_third.texture = sprite_life_empty
