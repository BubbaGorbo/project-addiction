extends Control

@export var target: Node3D

signal target_signal

func _ready() -> void:
	var target_array = get_tree().get_nodes_in_group("target_enemy")
	var target = target_array[0]
	target_signal.emit(target)
	
func set_target(node) -> void:
	var target = node
	target_signal.emit(target)
