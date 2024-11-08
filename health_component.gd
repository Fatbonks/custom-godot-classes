extends Node
class_name HealthComponent

enum EntityType {
	PLAYER, 
	ENEMY, 
	ITEM,
	
}

@export var max_health:int
@export var entity_type: EntityType


var health:int

func _ready() -> void:
	health = max_health


func _take_damage(damage:int) -> void:
	health -= damage
	if health <= 0:
		_on_death()
	
func _on_death() -> void:
	print("you died")
