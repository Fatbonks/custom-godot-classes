class_name Weapon
extends RigidBody3D
## this is the weapon node it only holds variables for weapons use hitscan or the projectile nodes.
## @experimental: still a work in progess fix yo node retard.

## more stuff
signal on_text_changed(text:String)
@export var base_damage:int

func _attack() -> void:
	pass
