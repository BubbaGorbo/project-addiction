extends Node3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var MOUSE_SENS = 0.25
@export var player_entity: CharacterBody3D

@export var health = 100
var max_health = 100
@export var mana = 50
var max_mana = 50
@export var entity_nameplate = 'Player (YOU)'

var target: Node3D

var isAutorunning = false

signal health_change
signal mana_change
signal target_change
	
func set_target(node: Node3D) -> void:
	var target = node
	target_change.emit(target)

func _ready() -> void:
	health_change.emit(health)
	mana_change.emit(mana)
	
#GlobalScope.time

func _physics_process(delta: float) -> void:
	movement(delta)
	
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_just_pressed("rmb"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_action_just_released("rmb"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
func damage(amount: int) -> void:
	if amount < 0:
		amount = 0
	health -= amount
	if health < 0:
		health = 0
	health_change.emit(health)
		
func heal(amount: int) -> void:
	if amount < 0:
		amount = 0
	health += amount
	if health > max_health:
		health = max_health
	health_change.emit(health)
	
func decrease_mana(amount: int) -> void:
	if amount < 0:
		amount = 0
	mana -= amount
	if mana < 0:
		mana = 0
	mana_change.emit(mana)
	
func increase_mana(amount: int) -> void:
	if amount < 0:
		amount = 0
	mana += amount
	if mana > max_mana:
		mana = max_mana
	mana_change.emit(mana)

func movement(delta: float) -> void:
	# Add the gravity.
	if not player_entity.is_on_floor():
		player_entity.velocity += player_entity.get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and player_entity.is_on_floor():
		player_entity.velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("auto_run"):
		isAutorunning = !isAutorunning
		if isAutorunning:
			Input.action_press("forward")
		else:
			Input.action_release("forward")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (player_entity.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		player_entity.velocity.x = direction.x * SPEED
		player_entity.velocity.z = direction.z * SPEED
	else:
		player_entity.velocity.x = move_toward(player_entity.velocity.x, 0, SPEED)
		player_entity.velocity.z = move_toward(player_entity.velocity.z, 0, SPEED)

	player_entity.move_and_slide()
	
func _input(event):
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		player_entity.rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
