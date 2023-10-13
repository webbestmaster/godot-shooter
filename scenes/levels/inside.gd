extends LevelParent

const outside_scene: PackedScene = preload("res://scenes/levels/outside.tscn")

func _on_exit_gate_area_body_entered(body):
	print("LEVEL _on_gate_player_intered_gate")
	print(body)
#	var tween = create_tween()
#	tween.tween_property($Player, "speed", 0, 1)
#	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
#	get_tree().change_scene_to_packed(outside_scene)

