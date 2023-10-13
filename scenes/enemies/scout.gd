extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var first_gun_use: bool = false
var health: int = 30
var vulnerable: bool = true

signal laser(pos, direction) 

func hit():
	if vulnerable:
		vulnerable = false
		$Timers/HitTimer.start()
		health -= 10
		$Scout.material.set_shader_parameter("progress", 1)
		if health <= 0:
			queue_free()

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_position)
		if can_laser:
			var marker_node = $LaserSpownPositions.get_child(int(first_gun_use)) 
			first_gun_use = not first_gun_use
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_position - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserTimer.start()
		

func _on_attack_area_body_entered(body):
	player_nearby = true # Replace with function body.


func _on_attack_area_body_exited(body):
	player_nearby = false # Replace with function body.


func _on_laser_timer_timeout():
	can_laser = true


func _on_hit_timer_timeout():
	vulnerable = true
	$Scout.material.set_shader_parameter("progress", 0)
