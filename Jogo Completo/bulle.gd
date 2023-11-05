extends Area2D

const speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += transform.y * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()

func _on_area_entered(area):
	print(area)
	if area.is_in_group("bulletCleaner"):
		queue_free()
