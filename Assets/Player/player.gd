extends CharacterBody2D

@export var SPEED : int = 150
@export var JUMP_FORCE : int = 255
@export var GRAVITY : int = 900
func _physics_process(delta):
	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("Idle")
	
	if direction == -1:
	
		$AnimatedSprite2D.play("Left")
	elif direction == 1:

		$AnimatedSprite2D.play("Right")
	if not is_on_floor():

		velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= JUMP_FORCE
		$AnimatedSprite2D.play("Jump")
		
