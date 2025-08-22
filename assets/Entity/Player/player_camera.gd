extends Camera3D

const ZOOM_SPEED = 0.25
const ZOOM_MAX = 10.0
const ZOOM_MIN = 0.0
const RAY_LENGTH = 1000

@onready var viewport = get_viewport()
@onready var world_3d = get_world_3d()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			position.z += ZOOM_SPEED
			position.z = clampf(position.z, ZOOM_MIN, ZOOM_MAX)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			position.z -= ZOOM_SPEED
			position.z = clampf(position.z, ZOOM_MIN, ZOOM_MAX)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("lmb"):
		var space_state = world_3d.direct_space_state
		var mousepos = viewport.get_mouse_position()

		var origin = project_ray_origin(mousepos)
		var end = origin + project_ray_normal(mousepos) * RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true

		var result = space_state.intersect_ray(query)
		var result_parent = null
		if result is StaticBody3D:
			result_parent = result.collider.get_parent()
		if result_parent:
			# Keep the node group down to one node by clearing it everytime here
			var target_group = get_tree().get_nodes_in_group("target_enemy")
			for node in target_group:
				node.remove_from_group("target_enemy")
			result_parent.add_to_group("target_enemy")
