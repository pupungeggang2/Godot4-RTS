extends Node2D

@onready var node_enemy = get_node('../../Enemy')

var direction = Vector2(0, 0)
var speed = 500.0
var damage = 5
var life_time = 1.5
var id = 0

func _ready():
	pass

func _process(delta):
	var velocity = Vector2(speed * direction.x, speed * direction.y)
	position += velocity * delta
	life_time -= delta
	
	if life_time < 0:
		queue_free()
		return
		
	for enemy in node_enemy.get_children():
		if (enemy.position - position).length() < 40:
			if id not in enemy.list_immune:
				enemy.hp -= damage
				enemy.list_immune.append(id)
				queue_free()
				return
