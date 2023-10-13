extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

signal player_laser(pos, direction)
signal player_grenade(pos, direction)
signal update_stats


#func _ready():
#	print('player')
#	print(Globals.laser_amount)

func hit():
	Globals.health -= 10

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	# position += direction * speed * delta
	# do not use _delta becuase velocity already uses delta
	velocity = direction * speed
	move_and_slide()
	Globals.player_position = global_position

	# rotate
	look_at(get_global_mouse_position())
		
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		print('shoot laser')
		var laser_markers = $LaserStartPosition.get_children()
		var selected_lase = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		var laser_direction = (get_global_mouse_position() - position).normalized()
		player_laser.emit(selected_lase.global_position, laser_direction)
		# emit position we selected
		$LaserReloadTimer.start()

	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
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
