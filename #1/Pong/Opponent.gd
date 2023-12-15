extends CharacterBody2D

@export var Move_speed: float = 150

@onready var Ball = get_node("/root/Node2D/Ball")
@onready var Mid = get_node("/root/Node2D/middle line")

var Ball_pos: Vector2

func _ready():
	position = Vector2(1316,384)
	Move_speed = 150
	
func _physics_process(_delta):
	
	Ball_pos = Ball.get("position")
	
	if(position.y != Ball_pos.y):
		if(position.y < Ball_pos.y):
			velocity.y = Move_speed
		if(position.y > Ball_pos.y):
			velocity.y = -Move_speed
		
	move_and_slide()
