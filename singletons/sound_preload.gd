extends Node


const SFX_BRICK_DESTROYED := preload("res://sound effects/sfx_brick_destroyed.wav")
const SFX_BRICK_LOWER_ENDURANCE := preload("res://sound effects/sfx_brick_lower_endurance.wav")
const SFX_DEFLECTION_BOUNCE_OFF := preload("res://sound effects/sfx_deflector_bounce_off.wav")
const SFX_EDGE_BOUNCE_OFF := preload("res://sound effects/sfx_edge_bounce_off.wav")
const SFX_LEVEL_UP := preload("res://sound effects/sfx_level_up.wav")
const SFX_LIFE_LOST :=preload("res://sound effects/sfx_life_lost.wav")
const SFX_LINE_CLEARED := preload("res://sound effects/sfx_line_cleared.wav")


func _ready():
	SoundManager.set_sound_volume(0.2)
