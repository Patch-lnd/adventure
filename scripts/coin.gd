extends Area2D

@onready var game_manager = %"game manager"
func _on_body_entered(body) :

 queue_free()
