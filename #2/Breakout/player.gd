extends CharacterBody2D

var isPaused = false
var GameOver = false
var lastVel: Vector2

@onready var Starting_pos = position
@onready var Panels = get_node("/root/MainScreen/Panels")
@onready var Ball = get_node("/root/MainScreen/Ball")

var SPEED = 300.0

func _physics_process(_delta):

	var direction = Input.get_axis("Left", "Right")
	
	if isPaused == false and Input.is_action_just_pressed("Esc"):
		Panels.PauseScreen()
		isPaused = true
		StopMovement()
		
	
	position.y = 718
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/25)

	move_and_slide()

func StopMovement():
	lastVel = Ball.velocity
	velocity = Vector2.ZERO
	SPEED = 0
	Ball.velocity = Vector2.ZERO

func Restart():
	SPEED = 300.0
	
