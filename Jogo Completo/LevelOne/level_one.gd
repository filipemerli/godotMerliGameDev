extends Node2D

var hasKey: bool = false
@onready var key = $key

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_key_body_entered(body):
	if body.is_in_group("player"):
		hasKey = true
		key.visible = false

func _on_door_body_entered(body):
	if body.is_in_group("player") and hasKey:
		get_tree().change_scene_to_file("res://LevelTwo/level_two.tscn")
