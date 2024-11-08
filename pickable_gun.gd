class_name PickableGun
extends Area3D

signal picked_up(new_parent:Node3D)
signal change_body(freeze:bool, sleeping:bool)



func pick_up_item(new_parent:Node3D) -> void:
	picked_up.emit(new_parent)
	monitorable = false
	change_body.emit(true, true)


func check_body(rigid_body:RigidBody3D) -> bool:
	if rigid_body == null:
		return false
	return true
