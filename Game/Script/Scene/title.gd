extends Node2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_released("mouse_left"):
		get_tree().change_scene_to_file('res://Scene/game.tscn')
