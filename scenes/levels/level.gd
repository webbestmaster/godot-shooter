extends Node2D

var test_array: Array[String] = [
	"test",
	"array",
	"here"
]

func _ready():
	$Logo.rotation_degrees += 1
	print('level node is ready')

	for i in test_array:
		print(i)

func _process(delta: float):
	$Logo.rotation_degrees += 100 * delta
	
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0

	if $Logo.position.x > 200:
		# actually get variable (var pos ...) from Logo.gd
		$Logo.pos.x = 0
		print($Logo.speed)
	


func _on_area_2d_body_entered(body):
	print('entered')
	print(body)


func _on_area_2d_body_exited(body):
	print('exited')
	print(body)
