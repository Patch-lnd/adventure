extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node) -> void:
	print("you died!")
	
	if body is Player:
	
		# Ralentir le jeu
		Engine.time_scale = 0.5

		# Supprimer le CollisionShape du joueur (désactive le contrôle)
		if body.has_node("CollisionShape2D"):
			body.get_node("CollisionShape2D").queue_free()

		# Démarrer le timer pour redémarrer après un délai
		timer.start()

func _on_timer_timeout() -> void:
	# Remettre la vitesse normale
	Engine.time_scale = 1.0

	# Recharger la scène
	get_tree().reload_current_scene()
