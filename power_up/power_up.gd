extends Area2D

const SPEED: float = 100.0

@onready var sprite_2d = $Sprite2D
@onready var sound = $Sound

var _power_up_type: GameData.POWERUP_TYPE = GameData.POWERUP_TYPE.SHIELD

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_powerup_deploy_sound(sound)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += delta * SPEED

func set_power_up_type(pu: GameData.POWERUP_TYPE) -> void:
	_power_up_type = pu
	sprite_2d.texture = GameData.POWER_UPS[_power_up_type]

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	SignalManager.on_powerup_hit.emit(_power_up_type)	
	queue_free()
