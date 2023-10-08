extends CharacterBody2D

func _process(_delta):
	# direction
	var direction = Vector2(1, 0) # Vector2.RIGHT
	
	# velicity
	velocity = direction * 100 
		
	# move and slide
	move_and_slide()
