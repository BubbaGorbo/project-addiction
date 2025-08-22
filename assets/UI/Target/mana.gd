extends Label

func _on_player_root_target_change(target: Node3D) -> void:
	text = 'Mana: ' + str(target.mana)
