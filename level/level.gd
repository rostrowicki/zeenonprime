extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Q) == true:
		GameManager.load_main_scene()
	if Input.is_key_pressed(KEY_E) == true:
		ObjectMaker.create_explosion(Vector2(100,200))
	if Input.is_key_pressed(KEY_B) == true:
		ObjectMaker.create_boom(Vector2(400,200))
