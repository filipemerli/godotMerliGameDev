extends CharacterBody2D

@onready var anim = $animation
const SPEED = 150.0
const JUMP_VELOCITY = -280.0
var jump: bool = false
var go_right: bool = false
var go_left: bool = false
@export_range(0.0, 1.0) var friction = 0.5
@export_range(0.0 , 1.0) var acceleration = 0.25
var walkCounter: int = 0
const fallingLabelScene = preload("res://Commun/damage_label.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 0:
			anim.play("idle")
		else:
			anim.play("fall")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			if walkCounter < 32:
				walkCounter += 1
				anim.play("walk")
			elif walkCounter == 32:
				anim.play("walkFast")
		if direction != 0:
			velocity.x = lerp(velocity.x, direction * SPEED, acceleration)
		anim.scale.x = -direction
	else:
		walkCounter = 0
		if is_on_floor():
			anim.play("idle")
		velocity.x = lerp(velocity.x, 0.0, friction)
	move_and_slide()
	
func setFallAnim():
	anim.play("fall")
	
func setIdleAnim():
	anim.set_frame_and_progress(0, 0.0)
	
func hit():
	var label = fallingLabelScene.instantiate()
	owner.add_child(label)
	label.position = position
	var cam = get_node("%camLvlFour")
	if cam is Camera2D:
		cam.emit_signal("shakeCam")
