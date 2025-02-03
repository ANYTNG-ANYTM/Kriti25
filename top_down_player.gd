extends CharacterBody2D

@onready var anima2D = $AnimatedSprite2D


var direction : Vector2 = Vector2()
var basis1 = Vector2(0,-1)  # Up	
var basis2 = Vector2(1,0)	# Right

func read_input():
	velocity = Vector2(0 , 0)
	if Input.is_action_pressed("Up"):
		velocity = Vector2(0 , 0)
		velocity += basis1
		direction = Vector2(0 , -1)
	
	if Input.is_action_pressed("Down"):
		velocity = Vector2(0 , 0)
		velocity -= basis1
		direction = Vector2(0 , 1)	
		
	if Input.is_action_pressed("Left"):
		velocity = Vector2(0 , 0)
		velocity -= basis2
		direction = Vector2(-1 , 0)	
		
	if Input.is_action_pressed("Right"):
		velocity = Vector2(0 , 0)
		velocity += basis2
		direction = Vector2 (1 , 0)	
		
	velocity = velocity.normalized() * 30
	move_and_slide()

func play_anim2D():
	if velocity:
		if direction == Vector2(-1 , 0):
			anima2D.play("RunLeft")
		elif direction == Vector2(0 , -1):
			anima2D.play("RunUp")
		elif direction == Vector2(0 , 0):
			pass
		elif direction == Vector2(0 , 1):
			anima2D.play("RunDown")
		elif direction == Vector2(1 , 0):
			anima2D.play("RunRight")
	else:
		if direction == Vector2(-1 , 0):
			anima2D.play("IdleLeft")
		elif direction == Vector2(0 , -1):
			anima2D.play("IdleUp")
		elif direction == Vector2(0 , 0):
			pass
		elif direction == Vector2(0 , 1):
			anima2D.play("IdleDown")
		elif direction == Vector2(1 , 0):
			anima2D.play("IdleRight")

func _physics_process(delta):
	read_input()
	play_anim2D()

	move_and_slide()


func _on_door_teleport():
	print("Debug")
	position = Vector2(6057 , 1741)

func _process(delta):
	pass
