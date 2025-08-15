extends Camera3D

const ZOOM_SPEED = 0.25
const ZOOM_MAX = 10.0
const ZOOM_MIN = 0.0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			position.z += ZOOM_SPEED
			position.z = clampf(position.z, ZOOM_MIN, ZOOM_MAX)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			position.z -= ZOOM_SPEED
			position.z = clampf(position.z, ZOOM_MIN, ZOOM_MAX)
