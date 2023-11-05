extends Camera2D

const FOLLOW_SPEED = 6.0
@onready var player = $"../Player"

func _ready():
	limit_left = -289
	limit_right = 910

func _physics_process(delta):
	if player:
		position = position.lerp(player.position, delta * FOLLOW_SPEED)
