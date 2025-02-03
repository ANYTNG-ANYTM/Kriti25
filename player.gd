extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var wait = false

var intdir = 0
var direction : Vector2 = Vector2()
var basis1 = Vector2(2,-1)  # Up	
var basis2 = Vector2(2,1)	# Right

func read_input():
	velocity = Vector2(0 , 0)
	direction = Vector2(0 , 0)
	if Input.is_action_pressed("Up"):
		velocity += basis1
		direction += Vector2(0 , -1)
	
	if Input.is_action_pressed("Down"):
		velocity -= basis1
		direction += Vector2(0 , 1)	
		
	if Input.is_action_pressed("Left"):
		velocity -= basis2
		direction += Vector2(-1 , 0)	
		
	if Input.is_action_pressed("Right"):
		velocity += basis2
		direction += Vector2 (1 , 0)	
		
	velocity = velocity.normalized() * 400
	

func play_anim():
	if direction == Vector2(-1 , -1):
		animation.play("Run7")
		intdir = 7
	elif direction == Vector2(-1 , 0):
		animation.play("Run6")
		intdir = 6
	elif direction == Vector2(-1 , 1):
		animation.play("Run5")
		intdir = 5
	elif direction == Vector2(0 , -1):
		animation.play("Run0")
		intdir = 0
	elif direction == Vector2(0 , 0):
		pass
	elif direction == Vector2(0 , 1):
		animation.play("Run4")
		intdir = 4
	elif direction == Vector2(1 , -1):
		animation.play("Run1")
		intdir = 1
	elif direction == Vector2(1 , 0):
		animation.play("Run2")
		intdir = 2
	elif direction == Vector2(1 , 1):
		animation.play("Run3")
		intdir = 3
	


func _physics_process(delta):
	read_input()
	
	if velocity:
		play_anim()
	else:
		animation.play("Idle0")
		animation.set_frame_and_progress(intdir , 0)
	if wait:
		await TransitionScreen.transition_finished
		wait = false
		position = Vector2(6162 , 1809)
	
	move_and_slide()


func _on_door_teleport():
	print("Debug")
	
	

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		position = Vector2(-782 , -203)


func _on_transition_screen_transition_finished():
	pass # Replace with function body.
