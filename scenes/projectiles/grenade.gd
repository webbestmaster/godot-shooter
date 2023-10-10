extends RigidBody2D


const speed: int = 1000

func explode():
	print("explode")
	$AnimationPlayer.play("Explosion")
