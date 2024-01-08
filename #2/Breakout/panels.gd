extends Control

@export var Pause = false
@export var GameOver = false

@onready var Player = get_node("/root/MainScreen/Player/")
@onready var Ball = get_node("/root/MainScreen/Ball/")
@onready var Starting = get_node("/root/MainScreen/")


func _ready():
	$PanelContainer/GameOver.visible = false
	$PanelContainer/Pause.visible = false


func _process(_delta):
	pass

func PauseScreen():
	$PanelContainer/Pause.visible = true
	$PanelContainer.visible = true

func GameOverScreen():
	$PanelContainer/GameOver.visible = true
	$PanelContainer.visible = true

func _on_resume_pressed():
	$PanelContainer/Pause.visible = false
	$PanelContainer.visible = false
	Ball.velocity = Player.lastVel
	Player.SPEED = 300.0
	


func _on_quit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	
	Player.Restart()
	Starting.Restart()
	Ball.Restart()
	$PanelContainer/GameOver.visible = false
	$PanelContainer.visible = false
	
	
