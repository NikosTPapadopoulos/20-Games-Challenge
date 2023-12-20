extends CharacterBody2D

var JUMP_VELOCITY: float = -100.0
var Move_Speed: float = 100.0
var current_velocity: Vector2

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var GameOverPanel : Node
@export var Pipes: Script
@export var Pause: Node

func _ready():
	position = Vector2(-300, 100)
	Move_Speed = 100.0
	JUMP_VELOCITY = -250.0
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	GameOverPanel.visible = false
	Pause.visible = false

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = Move_Speed
	
	GameOverPanel.global_position.x = position.x - 683
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		GameOver()
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
	
	if velocity != Vector2.ZERO:
		current_velocity = velocity
		
	if Input.is_action_just_pressed("Esc"):
		Pause.global_position.x = position.x - 683
		Pause.visible = true
		velocity = Vector2.ZERO
		gravity = 0
		Move_Speed = 0
		JUMP_VELOCITY = 0

func GameOver():
	Move_Speed = 0
	JUMP_VELOCITY = 0
	velocity = Vector2.ZERO
	gravity = 0
	GameOverPanel.visible = true
	GameOverPanel.get_node("Sound").playing = true

func Resume():
	velocity = current_velocity
	Move_Speed = 100.0
	JUMP_VELOCITY = -250.0
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Reload():
	_ready()
