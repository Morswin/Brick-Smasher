extends Node2D
class_name BrickRow


@onready var brick_scene := load("res://brick/brick.gd")

var center = 576  # This is where brick row's x should be set up to

@export var pos_first = 64
@export var pos_change = 32
@export var pos_last = 1088


func add_brick(_x: int) -> void:
	pass
