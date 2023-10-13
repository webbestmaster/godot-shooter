extends RigidBody2D


const speed: int = 1000

var explosion_actibve: bool = false
var explosion_radious = 400

func explode():
	print("explode")
	$AnimationPlayer.play("Explosion")
	explosion_actibve = true 
	
func _process(_delta):
	if explosion_actibve:
		var targets = get_tree().get_nodes_in_group('Container') + get_tree().get_nodes_in_group('Enity') 
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_radious
			if "hit" in target and in_range:
				target.hit()
