extends Node3D

@export var health = 100
var max_health = 100

@export var mana = 50
var max_mana = 50

@export var entity_nameplate = 'Mean Enemy >:('

signal health_change
signal mana_change

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
