extends LevelParent

func _on_gate_player_intered_gate(body):
	print("LEVEL _on_gate_player_intered_gate")
	print(body)
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1) 
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")
#	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
