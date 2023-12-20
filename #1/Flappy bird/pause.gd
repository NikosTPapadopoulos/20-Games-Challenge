extends PanelContainer

var p: Node

func _ready():
	p = get_node("/root/MainSceen/Player")
	

func _on_resume_pressed():
	p.Resume()
	visible = false
