extends Node3D

const MOUSE_SENS = 0.25

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var x_change = deg_to_rad(-event.relative.y * MOUSE_SENS)
		rotation.x += x_change
		var clampedRotation = clampf(rotation.x, -PI/3, PI/3)
		rotation.x = clampedRotation
