extends Control

signal GamePlay
signal RollCredits
var isCreditsOn = false

@onready var buttons_and_all = $"Buttons And All"
@onready var credits = $Credits
@onready var exit_button = $"Exit button"

func _ready():
	buttons_and_all.visible = true
	credits.visible = false
	exit_button.visible = false

func _on_play_pressed():
	GamePlay.emit()
	
func _on_credits_pressed():
	buttons_and_all.visible = false
	credits.visible = true
	exit_button.visible = true
	
func _on_exit_pressed():
	buttons_and_all.visible = true
	credits.visible = false
	exit_button.visible = false
