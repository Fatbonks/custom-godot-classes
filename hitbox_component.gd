extends Area3D
class_name HitboxComponent
@export var health_component:HealthComponent

func _damage(damage:int) -> void:
	health_component._take_damage(damage)
