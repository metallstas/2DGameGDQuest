extends CharacterBody2D

signal health_depleted

const SPEED := 600.0
var health := 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	var player = %HappyBoo
	
	if velocity.length() > 0.0:
		player.play_walk_animation()
	else:
		player.play_idle_animation()
	
	const DAMAGE_RATE = 5.0
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	
	if overlapping_enemies.size() > 0:
		health -= DAMAGE_RATE * overlapping_enemies.size() * delta
		if health <= 0.0:
			health_depleted.emit()
