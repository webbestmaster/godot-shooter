extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal player_laser(pos, direction)
signal player_grenade(pos, direction)

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	# position += direction * 500 * delta
	# do not use _delta becuase velocity already uses delta
	velocity = direction * 500
	move_and_slide()

	# rotate
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_laser:
		print('shoot laser')
		var laser_markers = $LaserStartPosition.get_children()
		var selected_lase = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		var laser_direction = (get_global_mouse_position() - position).normalized()
		player_laser.emit(selected_lase.global_position, laser_direction)
		# emit position we selected
		$LaserReloadTimer.start()

	if Input.is_action_pressed("secondary action") and can_grenade:
		print('throw greande')
		can_grenade = false
		var grenade_direction = (get_global_mouse_position() - position).normalized()
		var laser_markers = $LaserStartPosition.get_children()
		player_grenade.emit(laser_markers[randi() % laser_markers.size()].global_position, grenade_direction)
		$GrenadeReloadTimer.start()

func _on_laser_timer_timeout():
	print('_on_laser_timer_timeout')
	can_laser = true

func _on_grenade_reload_timer_timeout():
	print('_on_grenade_reload_timer_timeout')
	can_grenade = true
