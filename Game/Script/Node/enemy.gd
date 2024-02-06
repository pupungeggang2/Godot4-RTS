extends Node2D

@onready var node_projectile = get_node('../../Projectile')
@onready var hp_bar = get_node('LifeBar')
var hp = 60
var hp_max = 60
var list_immune = []

func _ready():
	pass

func _process(delta):
	hp_bar.size.x = float(hp) / hp_max * 80.0
	
	if hp < 1:
		queue_free()
		return
