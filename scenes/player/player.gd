extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
#	position += direction * 500 * delta
# do not use _delta becuase velocity already uses delta
	velocity = direction * 500
	move_and_slide()

	if Input.is_action_pressed("primary action") and can_laser:
		print('shoot laser')
		can_laser = false
		$LaserReloadTimer.start()

	if Input.is_action_pressed("secondary action") and can_grenade:
		print('throw greande')
		can_grenade = false
		$GrenadeReloadTimer.start()

func _on_laser_timer_timeout():
	print('_on_laser_timer_timeout')
	can_laser = true

func _on_grenade_reload_timer_timeout():
	print('_on_grenade_reload_timer_timeout')
	can_grenade = true
