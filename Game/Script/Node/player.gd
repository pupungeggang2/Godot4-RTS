extends Node2D

@onready var node_projectile_list = get_node('../Projectile')
@onready var node_camera = get_node('../Camera')
@export var speed = 300.0
var hp = 60
var hp_max = 60
var energy = 8
var energy_max = 8
var skill_ready = false
var skill_cool = 0
var skill_cool_max = 0.8

var destination = Vector2(0, 0)

func _ready():
	position = Vector2(40, 40)
	destination = Vector2(40, 40)

func _process(delta):
	handle_mouse()
	handle_keyboard()
	
	player_cooldown(delta)
	player_move(delta)
	
func create_projectile():
	var node_projectile = load("res://Scene/SubScene/projectile.tscn").instantiate()
	
	node_projectile.get_node("Image").texture = load("res://Image/Effect/Effect001.png")
	node_projectile.damage = 15
	node_projectile.id = Var.id_projectile
	Var.id_projectile += 1
	
	node_projectile.position = Vector2(position.x, position.y)
	var diff = get_viewport().get_mouse_position() + node_camera.position - position
	node_projectile.direction = diff.normalized()
	if diff.x > 0:
		node_projectile.rotation = atan(diff.y / diff.x)
	else:
		node_projectile.rotation = PI - atan(-diff.y / diff.x)
	
	node_projectile_list.add_child(node_projectile)	

func player_cooldown(delta):
	if skill_cool > 0:
		skill_cool -= delta

func player_move(delta):
	var diff = destination - position
	
	if diff.length() > 5:
		var diff_normalized = diff.normalized()
		position += diff_normalized * speed * delta
	
func handle_mouse():
	if Input.is_action_just_pressed("mouse_right"):
		var mouse = get_viewport().get_mouse_position()
		var x = mouse[0]
		var y = mouse[1]
		
		if Var.state == "":
			destination = node_camera.position + Vector2(x, y)
			
	if Input.is_action_just_pressed("mouse_left"):
		var mouse = get_viewport().get_mouse_position()
		var x = mouse[0]
		var y = mouse[1]
		
		if Var.state == "":
			if skill_ready == true:
				skill_ready = false
				skill_cool = skill_cool_max
				create_projectile()
	
func handle_keyboard():
	if Var.state == "":
		if Input.is_action_just_pressed("key_q"):
			if skill_cool <= 0:
				if skill_ready == false:
					skill_ready = true
				else:
					skill_ready = false
