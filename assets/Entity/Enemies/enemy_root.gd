extends Node3D

@export var target: Node3D

@onready var health: int = target.health
@onready var mana: int = target.mana
@onready var entity_nameplate: String = target.entity_nameplate
