class_name Hitscan
extends GunSystem
## This node derives from the weapon class and is meant for only hitscan weapons.

@export_group("Hitscan Variables")
@export var ray_cast:RayCast3D

var hitbox:HitboxComponent

func _attack() -> void:
	if !can_shoot or mag <= 0 or is_reloading:
		return
	can_shoot = false
	mag -= 1
	_set_text()
	if ray_cast.get_collider() is HitboxComponent:
		hitbox = ray_cast.get_collider()
		hitbox._damage(damage)
	can_shoot = await _gun_timer(fire_rate, can_shoot)

func _reload() -> void:
	if max_reserve <= 0 or mag == max_mag:
		return
	is_reloading = true
	var transfer_amount:int = min(max_reserve, max_mag - mag)
	max_reserve -= transfer_amount
	mag += transfer_amount
	_set_text()
	is_reloading = await _gun_timer(reload_time, is_reloading)
