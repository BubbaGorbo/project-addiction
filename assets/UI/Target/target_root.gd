extends Control

@export var target: Node3D

signal target_signal
	
func set_target(node) -> void:
	var target = node
	target_signal.emit(target)
