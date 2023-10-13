extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready():
	$SelfDestract.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if 'hit' in body:
#	if body.has_method('hit'):
		body.hit()
	if "is_enemy" in body:
		print('is enemy')
	queue_free()
	


func _on_self_destract_timeout():
	queue_free()
	

