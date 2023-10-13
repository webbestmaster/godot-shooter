extends Node

signal state_change

var player_vulnerable: bool = true

var laser_amount = 20:
	set(value):
		laser_amount = value
		state_change.emit()
	
var grenade_amount = 5:
	set(value):
		grenade_amount = value
		state_change.emit()

var health = 60:
	get:
		print('health value was read')
		return health
	set(value):
		print('health value was changed')
		if value > health:
			health = min(value, 100)
		else:
			if player_vulnerable:
				health = value
				player_vulnerable = false
				player_invulnerable_time()
				state_change.emit()

var player_position: Vector2

func player_invulnerable_time():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
