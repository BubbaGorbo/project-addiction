extends Label

var this_target: Node3D

func _on_player_root_target_change(target: Node3D) -> void:
	this_target = target
	text = 'Health: ' + str(target.health)


func _on_player_root_target_stat_change() -> void:
	text = 'Health: ' + str(this_target.health)
