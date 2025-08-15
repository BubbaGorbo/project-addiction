extends Label

func _on_player_entity_mana_change(mana) -> void:
	text = str(mana)
