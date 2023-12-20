extends Node2D

@export var Pipes: PackedScene

@export var s_flag: bool
@export var h_flag: bool

var Pipe_list = []

func _ready():
	s_flag = true
	h_flag = true

func _process(_delta):
	if s_flag == true:
		for i in range(1,100):
			var Pipe = Pipes.instantiate()
			add_child(Pipe)
			Pipe.position.x = i * 400
			s_flag = false
			Pipe_list.append(Pipe)
	if h_flag == true:
		for l in Pipe_list:
			l.position.y = randf_range(-643, -100)
			h_flag= false
	
