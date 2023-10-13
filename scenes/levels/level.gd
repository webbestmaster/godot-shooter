extends Node2D

class_name LevelParent

var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload('res://scenes/projectiles/grenade.tscn')
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

#var test_array: Array[String] = [
#	"test",
#	"array",
#	"here"
#]

func _ready():
	print('level node is ready')
	var list = get_tree().get_nodes_in_group("Container")
	
	for container in list:
		container.connect("open", _on_container_opened)

	for container in get_tree().get_nodes_in_group("Scouts"):
		container.connect("laser", _on_scout_laser)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',  item)

func _on_scout_laser(pos, direction):
	create_laser(pos, direction)

func create_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _process(_delta: float):
	pass

func _on_player_player_laser(global_pos, laser_direction: Vector2):
#	var laser = laser_scene.instantiate() as Area2D
#	laser.position = global_pos
#	laser.rotation_degrees = rad_to_deg(laser_direction.angle()) + 90
#	laser.direction = laser_direction
#	$Projectiles.add_child(laser)
	
	create_laser(global_pos, laser_direction)
	$UI.update_laset_text()

func _on_player_player_grenade(global_pos, grenade_direction):
	print("LEVEL _on_player_greande")
	var grenade:RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = global_pos
	grenade.linear_velocity = grenade_direction * grenade.speed

	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_QUAD)
		# .from(0.8)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
#	tween.tween_property($Player, "modulate:a", 1, 1)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_QUAD)

func _on_player_update_stats():
	$UI.update_grenade_text()
	$UI.update_laset_text()
