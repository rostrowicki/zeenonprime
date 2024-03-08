extends Area2D

class_name Player

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

@export var speed: float = 250.0

const MARGIN: float = 32.0

var _upper_left: Vector2
var _lower_right: Vector2


func _ready():
	var vp = get_viewport_rect()
	_lower_right = Vector2(
		vp.size.x - MARGIN,
		vp.size.y - MARGIN
	)
	_upper_left = Vector2(MARGIN, MARGIN 	)

func _process(delta):
	var input = get_input()
	
	global_position += input * delta * speed
	global_position = global_position.clamp(
		_upper_left,
		_lower_right
	)
	
func get_input() -> Vector2:
	var v = Vector2(
		Input.get_axis("left","right"),
		Input.get_axis("up","down")
	)
	
	if v.x != 0:
		animation_player.play("turn")
		if v.x > 0:
			sprite_2d.flip_h = true
		else:
			sprite_2d.flip_h = false
	else:
		animation_player.play("fly")

	return v.normalized()

