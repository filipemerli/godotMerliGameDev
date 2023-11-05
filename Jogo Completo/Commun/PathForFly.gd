extends Path2D

@onready var follow = $PathFollow2D
@onready var fly = $PathFollow2D/Fly
var progress = 1
const duration = 6
signal flipFly

# Called when the node enters the scene tree for the first time.
func _ready():
	followPath()
	
func followPath():
	emit_signal("flipFly")
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(follow, 'progress_ratio', progress, duration)
	await get_tree().create_timer(duration).timeout
	if progress == 1:
		progress = 0
	else:
		progress = 1
	followPath()
