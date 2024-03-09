extends Node

enum ENEMY_TYPE { ZIPPER, BIO, BOMBER, TEST }
enum POWERUP_TYPE { HEALTH, SHIELD }

const POWER_UPS = {
	POWERUP_TYPE.HEALTH: preload("res://assets/misc/powerupGreen_bolt.png"),
	POWERUP_TYPE.SHIELD: preload("res://assets/misc/shield_gold.png")
}
