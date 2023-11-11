extends StaticBody2D

@onready var anim = $AnimatedSprite2D
@onready var marker = $Marker2D
var bullet = preload("res://Commun/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	fire()

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_down"):
		fire()

func flipAnim():
	anim.flip_h = !anim.flip_h

func _on_path_2d_flip_fly():
	flipAnim()

func fire():
	var b = bullet.instantiate()
	owner.add_child.call_deferred(b)
	b.transform = marker.global_transform
	await get_tree().create_timer(0.7).timeout
	fire()
