extends Node2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_released("mouse_left"):
		var scene_field = load("res://Scene/field.tscn").instantiate()
		scene_field.name = "Field"
		get_tree().root.get_node("Title").queue_free()
		get_tree().root.add_child(scene_field, true)
