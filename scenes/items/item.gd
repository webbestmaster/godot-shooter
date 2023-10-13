extends Area2D

var rotation_speed: int = 5

var available_option = ["laser", "grenade", "health"]
var type = available_option[randi() % len(available_option)]

var direction: Vector2
var disatnce: int = randi_range(150, 250)


func _ready():
	if type == available_option[0]:
		$Orb2.modulate = Color("0000cc")
	
	if type == available_option[1]:
		$Orb2.modulate = Color("00cc00")
		
	if type == available_option[2]:
		$Orb2.modulate = Color("cc0000")
	
	var targer_pos = position + direction * disatnce 
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", targer_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0.1, 0.1))

func _process(delta):
	rotation += delta * rotation_speed


func _on_body_entered(_body):
	if type == 'health':
		Globals.health += 20
	if type == 'laser':
		Globals.laser_amount += 20
	if type == 'grenade':
		Globals.grenade_amount += 5
	
	queue_free()
