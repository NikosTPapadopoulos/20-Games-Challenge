extends CharacterBody2D

var Starting_Shot: Vector2
var Starting_pos: Vector2 = Vector2(683, 664)
var hp = 3

@onready var Bricks = get_node("/root/MainScreen")
@onready var Player = get_node("/root/MainScreen/Player")

@export var MS: float = 150

var toShoot: bool

func _ready():
	toShoot = true
	position = Starting_pos
	hp = 3


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if hp == 0:
		Player.Panels.GameOverScreen()
		Player.isPaused = true
		Player.StopMovement()
	
	if toShoot:
		_random_shooting()
		toShoot = false
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if position.x <= 1326 and position.x >= 40 and position.y <= 660 and position.y >= 100:
			collision.get_collider().queue_free()
			if(velocity > Vector2.ZERO):
				velocity += Vector2(5,5)
			if(velocity < Vector2.ZERO):
				velocity -= Vector2(5,5)
	
	move_and_slide()
	
	Lost()

func _random_shooting():
	Starting_Shot = Vector2(randf_range(-0.9, 0.9), randf_range(0.2, -1))
	velocity = Vector2(MS, MS).rotated(Starting_Shot.angle())
	position = Starting_pos
	
func Lost():
	if position.y > Player.position.y:
		velocity = Vector2.ZERO
		_random_shooting()
		Player.global_position = Player.Starting_pos
		Bricks.hearts[hp - 1].queue_free()
		hp -= 1
		
func Restart():
	_ready()
	
