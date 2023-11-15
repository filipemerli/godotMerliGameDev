extends Camera2D

class_name MyCustomCam

const initialStrength: float = 15.0
const shakeFade: float = 9.0

var shakeStrength: float = 0.0

func _process(delta):
	if shakeStrength > 0.05:
		shakeStrength = lerp(shakeStrength, 0.0, shakeFade * delta)
		offset = randomOffset()

func shake():
	shakeStrength = initialStrength

func randomOffset() -> Vector2:
	return Vector2(randf_range(-shakeStrength, shakeStrength), 
	randf_range(-shakeStrength, shakeStrength))
