extends Label

var this_target: Node3D

func _on_player_root_target_change(target: Node3D) -> void:
	this_target = target
	text = 'Mana: ' + str(target.mana)


func _on_player_root_target_stat_change() -> void:
	text = 'Mana: ' + str(this_target.mana)
