extends Area2D

var _direction: Vector2 = Vector2.UP
var _speed: float = 200.0
var _damage: int = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += _direction * _speed * delta
	
func setup(position: Vector2, direction: Vector2, speed: float, damage: int) -> void:
	_direction = direction
	_speed = speed
	_damage = damage
	global_position = position


func blow_up(area: Node2D) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	blow_up(area)
