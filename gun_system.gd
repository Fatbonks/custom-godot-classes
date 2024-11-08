class_name GunSystem
extends Weapon

@export var is_active:bool
@export var fire_rate:float
@export var position_in_player_hands: Vector3
@export_subgroup("Magazine capacity")
@export var max_mag:int
@export var max_reserve:int

@export_subgroup("reload")
@export var reload_time:float

@export_subgroup("Gun variables")
@export var fire_rate_timer:Timer
@export var reload_timer:Timer
@export var pick_gun:PickableGun
## internal variable used only in the script
var total_damage:int
var damage:int
var mag:int
var can_shoot:bool = true
var is_reloading:bool = false
var bullet_text:String:
	set(value):
		bullet_text = value
		on_text_changed.emit(value)


func _ready() -> void:
	mag = max_mag


func _reload() -> void:
	pass



func _gun_timer(time:float, changed_bool:bool) -> bool:
	await get_tree().create_timer(time).timeout
	return !changed_bool


func _set_text() -> void:
	bullet_text = str(mag) + " / " + str(max_reserve)

func _set_weapon_parent(new_parent:Node3D) -> void:
	var tween:Tween = create_tween()
	reparent(new_parent, true)
	tween.set_parallel()
	tween.tween_property(self, 'position', position_in_player_hands, 0.5).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'rotation_degrees', 0, 0.5).set_ease(Tween.EASE_IN_OUT)

func _throw_gun() -> void:
	var root: Window = get_tree().root
	reparent(root)
	pick_gun.monitorable = true
	_chance_body_setting(false, true)
	apply_central_impulse(-basis.z * 10)

func _chance_body_setting(freeze_state: bool, sleeping_state: bool) -> void:
	freeze = freeze_state
	sleeping = sleeping_state
