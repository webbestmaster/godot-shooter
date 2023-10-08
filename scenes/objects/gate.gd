extends StaticBody2D

signal player_intered_gate(body)

func _on_area_2d_body_entered(body):
	print("body intered")
	player_intered_gate.emit(body)
