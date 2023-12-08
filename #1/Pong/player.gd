extends Sprite2D

var MoveVec: Vector2 = Vector2(0,0)

@export var velocity: float = 5

func _physics_process(_delta):
	if(Input.is_action_pressed("Up")):
		MoveVec = Vector2(0,-1)
	elif(Input.is_action_pressed("Down")):
		MoveVec = Vector2(0,1)
	else:
		MoveVec = Vector2(0,0)
	position = position + MoveVec * velocity


