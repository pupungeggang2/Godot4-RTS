extends Node2D

@onready var node_player = get_node("Player")
@onready var node_camera = get_node("Camera")
@onready var text_hp = get_node("UI/TextHP")
@onready var text_energy = get_node("UI/TextEnergy")
@onready var rect_cool = get_node("UI/PlayerCool")
@onready var image_skill_ready = get_node("UI/SkillReady")

func _ready():
	create_enemy()

func _process(delta):
	update_ui()
	handle_keyboard(delta)

func create_enemy():
	for i in range(5):
		var node_enemy = load("res://Scene/SubScene/enemy.tscn").instantiate()
		node_enemy.get_node("Image").texture = load("res://Image/Enemy/Enemy001.png")
		node_enemy.position = Vector2(randi_range(320, 960), randi_range(160, 560))
		get_node("Enemy").add_child(node_enemy)

func update_ui():
	text_hp.text = str(node_player.hp) + "/" + str(node_player.hp_max)
	text_energy.text = str(node_player.energy) + "/" + str(node_player.energy_max)
	rect_cool.size.y = float(node_player.skill_cool) / node_player.skill_cool_max * 80
	if node_player.skill_ready == true:
		image_skill_ready.show()
	else:
		image_skill_ready.hide()
		
func handle_keyboard(delta):
	if Var.state == "":
		if Input.is_action_pressed("key_up"):
			node_camera.position.y -= 300.0 * delta
		if Input.is_action_pressed("key_left"):
			node_camera.position.x -= 300.0 * delta
		if Input.is_action_pressed("key_down"):
			node_camera.position.y += 300.0 * delta
		if Input.is_action_pressed("key_right"):
			node_camera.position.x += 300.0 * delta
