extends PathFollow2D

@onready var state_machine = $AnimationTree["parameters/playback"]

const SPEED: float = 0.05
const SHOOT_PROGRESS: float = 0.02
const FIRE_OFFSETS = [0.25, 0.5, 0.75]

var _shooting: bool = false
var _shots_fired: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_ratio = 0.0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _shooting == false:
		progress_ratio += SPEED * delta
		try_shoot()
	
	
func update_shots_fired() -> void:
	_shots_fired += 1
	if _shots_fired >= len(FIRE_OFFSETS):
		_shots_fired = 0


func try_shoot() -> void:
	if abs(progress_ratio - FIRE_OFFSETS[_shots_fired]) < SHOOT_PROGRESS:
		state_machine.travel("shoot")
		update_shots_fired()


func set_shooting(v: bool) -> void:
	_shooting = v
	
