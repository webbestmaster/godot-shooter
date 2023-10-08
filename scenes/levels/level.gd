extends Node2D

var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload('res://scenes/projectiles/grenade.tscn')

var test_array: Array[String] = [
	"test",
	"array",
	"here"
]

func _ready():
	print('level node is ready')

	for i in test_array:
		print(i)

func _process(delta: float):
	pass

func _on_gate_player_intered_gate(body):
	print("LEVEL _on_gate_player_intered_gate")
	print(body)

func _on_player_player_laser(global_pos, laser_direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = global_pos
	laser.rotation_degrees = rad_to_deg(laser_direction.angle()) + 90
	laser.direction = laser_direction
	
	$Projectiles.add_child(laser)

func _on_player_player_grenade(global_pos, grenade_direction):
	print("LEVEL _on_player_greande")
	var grenade:RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = global_pos
	grenade.linear_velocity = grenade_direction * grenade.speed

	$Projectiles.add_child(grenade)
	
	
	
