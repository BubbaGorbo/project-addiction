extends Label

func _on_player_root_health_change(health) -> void:
	text = 'Health: ' + str(health)
