extends Node2D

@export var Bricks: PackedScene
@export var Hearts: PackedScene

var l = []
var hearts = []

func _ready():
	Spawn()
	for i in range(3):
		var h = Hearts.instantiate()
		add_child(h)
		h.position.x = i * 100 + 100
		hearts.append(h)


func _process(_delta):
	pass
	
func Spawn():
	for i in range(0,12):
		var brick = Bricks.instantiate()
		add_child(brick)
		brick.position.x = 110 * i + 3
		l.append(brick)
		
func Restart():
	hearts = []
	for i in l:
		i.queue_free()
	l = []
	_ready()
