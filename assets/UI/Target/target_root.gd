extends Control

@export var target: Node3D

signal on_ready_signal

func _ready() -> void:
	on_ready_signal.emit(target.enemy_node)
