extends Camera2D

const FOLLOW_SPEED = 6.0
@onready var player = $"../Player"
const initialStrength: float = 15.0
const shakeFade: float = 9.0

var shakeStrength: float = 0.0
signal shakeCam

func _ready():
	connect("shakeCam", shake)
	limit_left = -289
	limit_right = 910

func shake():
	shakeStrength = initialStrength

func _process(delta):
	if shakeStrength > 0.05:
		shakeStrength = lerp(shakeStrength, 0.0, shakeFade * delta)
		var vec = randomOffset()
		print(vec)
		offset = vec

func _physics_process(delta):
	if player:
		position = position.lerp(player.position, delta * FOLLOW_SPEED)

func randomOffset() -> Vector2:
	return Vector2(randf_range(-shakeStrength, shakeStrength), 
	randf_range(-shakeStrength, shakeStrength)
	)
