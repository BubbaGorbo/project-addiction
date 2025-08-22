extends Label3D

@export var player: Node3D

func _ready() -> void:
	text = player.entity_nameplate
