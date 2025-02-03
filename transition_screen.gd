extends CanvasLayer

signal transition_started
signal transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	color_rect.visible = false



func transition():
	color_rect.visible = true
	print("NOOO")
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	transition_started.emit()
	animation_player.play("fade_to_normal")
	await animation_player.animation_finished
	transition_finished.emit()
	color_rect.visible = false
	
