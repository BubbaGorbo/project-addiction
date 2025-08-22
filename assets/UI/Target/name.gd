extends Label

@export var root_node: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(root_node.target)
	#text = str(root_node.target.get_root_name())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_target_root_on_ready_signal(target: Node3D) -> void:
	text = str(target.entity_nameplate)
