extends Node2D


var saucer_scene: PackedScene = preload("res://enemies/saucer.tscn")

const WAIT_TIME: float = 8.0
const WAIT_VAR: float = 1.0

@onready var timer = $Timer
@onready var paths = $Paths.get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_saucer()


func spawn_saucer() -> void:
	var p = paths.pick_random()
	var s = saucer_scene.instantiate()
	p.add_child(s)
	Utils.set_and_start_timer(timer, WAIT_TIME, WAIT_VAR)

func _on_timer_timeout():
	spawn_saucer()
