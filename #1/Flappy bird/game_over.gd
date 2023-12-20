extends PanelContainer

@export var f : Node
@export var p : Node
@export var points : Node

func _physics_process(_delta):
	position = Vector2(p.position.x, position.y)
	
func _on_restart_pressed():
	f.h_flag = true
	p._ready()
	visible = false
	points.points = 0
