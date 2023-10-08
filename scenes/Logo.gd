extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_scale: float = 1
const speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	test_scale = 2
	pos = Vector2(200, 300)
	position = pos
	print('ready')
	
#	var test_rotation = 45
#	rotation_degrees = test_rotation
	scale = Vector2(test_scale, test_scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	test_scale += 0.01
#	scale = Vector2(test_scale, test_scale)
	pos.x += speed * delta
	position = pos
