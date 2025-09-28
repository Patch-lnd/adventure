extends CharacterBody2D
class_name Player

const SPEED = 250.0
const JUMP_VELOCITY = -250.0

func _physics_process(delta: float) -> void:
	# Gravité
	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	# Saut
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#play animations

	# Mouvement horizontal
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Appliquer le mouvement
	move_and_slide()
