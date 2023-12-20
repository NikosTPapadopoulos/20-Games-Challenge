extends Label

@export var p: Node
@export var GameOver: Node

var points: int
var counter: int
var S_pos: float

func _ready():
	points = 0
	text = str(points)
	S_pos = position.x


func _physics_process(_delta):
	position.x = p.global_position.x
	text = str(points)
	
