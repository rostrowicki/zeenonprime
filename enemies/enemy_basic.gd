extends PathFollow2D


@export var shoots: bool = false
@export var aims_at_player: bool = false
@export var bullet_scene: PackedScene
@export var bullet_damage: int = 10
@export var bullet_speed: float = 200.0
@export var bullet_direction: Vector2 = Vector2.DOWN
@export var bullet_wait_time: float = 3.0 # seconds
@export var bullet_wait_time_var: float = 0.05

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var laser_timer = $LaserTimer
@onready var booms = $Booms
@onready var health_bar = $HealthBar

var _player_ref: Player
var _speed: float = 0.0
var _can_shoot: bool = false
var _dead: bool = false
var _anim_string: String

# Called when the node enters the scene tree for the first time.
func _ready():
	_player_ref = get_tree().get_first_node_in_group(GameData.GROUP_PLAYER)
	if !_player_ref:
		queue_free()
	animated_sprite_2d.play(_anim_string)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += _speed * delta
	if progress_ratio > 0.99:
		queue_free()


func setup(speed: float, anim_name: String) -> void:
	_speed = speed
	_anim_string = anim_name


func update_bullet_direction() -> void:
	if (aims_at_player == false || is_instance_valid(_player_ref) == false ):
		print("invalid", aims_at_player, is_instance_valid(_player_ref))
		return
	bullet_direction = global_position.direction_to(
		_player_ref.global_position
	)
	

func start_shoot_timer() -> void:
	Utils.set_and_start_timer(
		laser_timer,
		bullet_wait_time,
		bullet_wait_time_var
	)


func shoot() -> void:
	var b = bullet_scene.instantiate()
	update_bullet_direction()
	b.setup(
		global_position,
		bullet_direction,
		bullet_speed,
		bullet_damage
	)
	get_tree().root.add_child(b)
	start_shoot_timer()

func _on_laser_timer_timeout():
	shoot()


func _on_visible_on_screen_notifier_2d_screen_entered():
	if shoots == true:
		start_shoot_timer()


func _on_visible_on_screen_notifier_2d_screen_exited():
	set_process(false)
	queue_free()


func _on_area_2d_area_entered(area):
	health_bar.take_damage(20)


func _on_health_bar_died():
	set_process(false)
	queue_free()
