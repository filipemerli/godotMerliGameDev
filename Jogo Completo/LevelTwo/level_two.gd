extends Node2D

@onready var key = $key
@onready var player = $Player

var playerInitialPos
var keyInitialPos
var hasKey: bool = false

signal didHurt

# Called when the node enters the scene tree for the first time.
func _ready():
	playerInitialPos = player.position
	keyInitialPos = key.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_spikes_three_body_entered(body):
	if body.is_in_group("player"):
		restartPlayer()

func _on_key_body_entered(body):
	if body.is_in_group("player"):
		hasKey = true
		key.visible = false

func _on_door_body_entered(body):
	if body.is_in_group("player") and hasKey:
		get_tree().change_scene_to_file("res://LevelThree/level_three.tscn")

func restartPlayer():
	hasKey = false
	player.visible = false
	player.position = playerInitialPos
	key.position = keyInitialPos
	player.visible = true
	key.visible = true
