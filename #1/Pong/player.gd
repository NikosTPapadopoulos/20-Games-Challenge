extends CharacterBody2D

@export var Move_Speed: float = 200

@onready var Pause = get_node("/root/Node2D/Pause/")
@onready var Ball = get_node("/root/Node2D/Ball/")

func _ready():
	position = Vector2(50,384)
	Move_Speed = 200
	Pause.visible = false

func _physics_process(_delta):
	
	var input_dir: Vector2 = Vector2(0,
	Input.get_action_strength("Down")-Input.get_action_strength("Up")
	)
	
	velocity = input_dir * Move_Speed
	
	move_and_slide()
	
	OpenEscPanel()

func OpenEscPanel():
	if Input.is_action_just_pressed("Esc"):
		Pause.visible = true
		Move_Speed = 0
		Ball.velocity = Vector2.ZERO
		Ball.Opponent.velocity = Vector2.ZERO
	
