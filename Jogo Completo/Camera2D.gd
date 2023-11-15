extends MyCustomCam

const FOLLOW_SPEED = 6.0
@onready var player = $"../Player"

signal shakeCam

func _ready():
	connect("shakeCam", triggerShake)
	limit_left = -289
	limit_right = 910

func _process(_delta):
	print("My Process here")

func triggerShake():
	shake()

func _physics_process(delta):
	if player:
		position = position.lerp(player.position, delta * FOLLOW_SPEED)
