extends Node2D

@export var speed = 300.0
var hp = 60
var hp_max = 60
var energy = 8
var energy_max = 8

var destination = Vector2(0, 0)

func _ready():
	position = Vector2(40, 40)
	destination = Vector2(40, 40)
	
func _process(delta):
	if Var.state == '':
		if Input.is_action_just_pressed("mouse_right"):
			var mouse = get_viewport().get_mouse_position()
			var x = mouse[0]
			var y = mouse[1]
			mouse_handle_right(x, y)
		
		move_player(delta)
	
func move_player(delta):
	var diff = destination - position
	
	if diff.length() > 5:
		var diff_normalized = diff.normalized()
		position += diff_normalized * speed * delta
		
func mouse_handle_right(x, y):
	destination = Vector2(x, y)
