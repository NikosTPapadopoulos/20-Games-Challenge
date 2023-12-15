extends CharacterBody2D

@export var Move_speed: float = 200
@export var PPoints: int = 0
@export var EPoints: int = 0
@onready var Opponent = get_node("/root/Node2D/opponent/")
@onready var Player = get_node("/root/Node2D/player/")

var Starting_Shot: Vector2
var Starting_pos: Vector2 = Vector2(683, 384)

@onready var PPoints_Label = get_node("/root/Node2D/PlayerPoints")
@onready var EPoints_Label = get_node("/root/Node2D/EnemyPoints")

func _ready():
	position = Vector2(683, 384)
	
	EPoints = 0
	PPoints = 0
	
	Rand_Shot()

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	
	PPoints_Label.text = str(PPoints)
	EPoints_Label.text = str(EPoints)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if(velocity > Vector2.ZERO):
			velocity += Vector2(25,25)
		if(velocity < Vector2.ZERO):
			velocity -= Vector2(25,25)
		$Effect.playing = true
	else:
		$Effect.playing = false
	
	AddPoint()

func Rand_Shot():
	Starting_Shot = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	position = Starting_pos
	velocity = Vector2(Move_speed, 0).rotated(Starting_Shot.angle())

func AddPoint():
	if(position.x < 75 or position.x > 1316):
		if(position.x < 75):
			EPoints += 1
		if(position.x > 949):
			PPoints += 1
		Rand_Shot()
		Player._ready()
		Opponent._ready()

func Restart():
	_ready()
	Player._ready()
	Opponent._ready()
