extends Label3D

@onready var player_camera: Camera3D = get_tree().get_nodes_in_group("player_camera")[0]
func _on_rigid_body_3d_nameplate_signal(name: String) -> void:
	text = name
