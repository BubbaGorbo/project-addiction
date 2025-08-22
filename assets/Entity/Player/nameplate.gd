extends Label3D

@export var enemy_entity: Node3D

func _ready() -> void:
	text = enemy_entity.entity_nameplate
