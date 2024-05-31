extends PathFollow2D

const SPEED: float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_ratio = 0.0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += SPEED * delta
