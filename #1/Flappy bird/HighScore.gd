extends Label

@export var Points : Node
@export var GameOver : Node

var Last_Points: int = 0

func _ready():
	pass

func _process(_delta):
	if GameOver.visible != true:
		position = Points.position + Vector2(-680, 0)
	
	if GameOver.visible == true:
		position = Points.position + Vector2(-150, 350)
		if Last_Points < Points.points:
			Last_Points = Points.points
	text = "Highest Score: " + str(Last_Points)
