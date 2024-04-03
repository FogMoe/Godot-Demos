extends Node2D

const MyPlane = preload("res://Scenes/Plane.tscn")
const MyTarget = preload("res://Scenes/Target.tscn")
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(MyPlane.instantiate())
	create_target()

func create_target():
	if target:
		target.queue_free()
	target = MyTarget.instantiate()
	target.position = Vector2(randi() % 10 * 80, randi() % 10 * 80)  # Position is a multiple of 80
	call_deferred("add_child", target)
