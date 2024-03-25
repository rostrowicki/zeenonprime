extends Node2D

const ANIM_FRAMES = {
	GameData.ENEMY_TYPE.ZIPPER: [ "zipper_1", "zipper_2", "zipper_3"],
	GameData.ENEMY_TYPE.BIO: [ "biomech_1", "biomech_2", "biomech_3"],
	GameData.ENEMY_TYPE.BOMBER: [ "bomber_1", "bomber_2", "bomber_3"]
}

const ENEMY_SCENES = {
	GameData.ENEMY_TYPE.ZIPPER: preload("res://enemies/enemy_zipper.tscn"),
	GameData.ENEMY_TYPE.BIO: preload("res://enemies/enemy_bio.tscn"),
	GameData.ENEMY_TYPE.BOMBER: preload("res://enemies/enemy_bomber.tscn")
}

@onready var paths = $Paths

var _paths_list: Array = []


func _ready():
	_paths_list = paths.get_children()
	spawn_wave()

func create_enemy(speed: float, anim_name: String, enemy_type: GameData.ENEMY_TYPE) -> Node:
	var new_enemy = ENEMY_SCENES[enemy_type].instantiate()
	new_enemy.setup(speed, anim_name)
	return new_enemy	

func spawn_wave() -> void:
	var path = _paths_list.pick_random()
	var enemy_type = GameData.ENEMY_TYPE.values().pick_random()
	var anim = ANIM_FRAMES[enemy_type].pick_random()
	
	for num in range(4):
		path.add_child(create_enemy(0.2, anim, enemy_type))
		print('create enemy')
		await get_tree().create_timer(1).timeout #wait 1 second before loop continues

# spawn wave every SpawnTimer.X seconds
func _on_spawn_timer_timeout():
	spawn_wave()
