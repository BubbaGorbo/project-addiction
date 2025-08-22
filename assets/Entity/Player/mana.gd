extends Label

func _on_player_root_mana_change(mana) -> void:
	text = 'Mana: ' + str(mana)
