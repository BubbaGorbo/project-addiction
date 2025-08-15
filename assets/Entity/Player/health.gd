extends Label

func _on_player_entity_health_change(health: int) -> void:
	text = str(health)
