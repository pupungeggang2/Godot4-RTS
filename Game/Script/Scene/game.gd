extends Node2D

@onready var node_player = get_node("Player")
@onready var text_hp = get_node("UI/TextHP")
@onready var text_energy = get_node("UI/TextEnergy")

func _ready():
	pass

func _process(delta):
	update_ui()

func update_ui():
	text_hp.text = str(node_player.hp) + "/" + str(node_player.hp_max)
	text_energy.text = str(node_player.energy) + "/" + str(node_player.energy_max)
