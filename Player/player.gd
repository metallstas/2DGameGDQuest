extends CharacterBody2D

const SPEED := 600.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	var player = get_node("HappyBoo")
	
	if velocity.length() > 0.0:
		player.play_walk_animation()
	else:
		player.play_idle_animation()
