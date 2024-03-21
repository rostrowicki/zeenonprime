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


