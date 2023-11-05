extends Node2D

var hasKey: bool = false
@onready var key = $key
@onready var cam = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	cam.position.x = 142

func _on_key_body_entered(body):
	if body.is_in_group("player"):
		hasKey = true
		key.visible = false

func _on_door_body_entered(body):
	if body.is_in_group("player") and hasKey:
		get_tree().change_scene_to_file("res://level_four.tscn")

func _on_left_area_body_entered(body):
	if body.is_in_group("player"):
		var tween = get_tree().create_tween()
		tween.tween_property(cam, "position:x", 142, 0.4)

func _on_righ_area_body_entered(body):
	if body.is_in_group("player"):
		var tween = get_tree().create_tween()
		tween.tween_property(cam, "position:x", 274, 0.4)
