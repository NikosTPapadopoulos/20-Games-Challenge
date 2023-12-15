extends PanelContainer

@onready var Ball = get_node("/root/Node2D/Ball")

var Ball_v: Vector2

func _physics_process(_delta):
	if(Ball.velocity != Vector2.ZERO):
		Ball_v = Ball.velocity
	
	get_node("/root/Node2D/Ball/Effect/").volume_db = get_node("/root/Node2D/Pause/Resume/Audio/").value

func _on_resume_pressed():
	Ball.velocity = Ball_v
	Ball.Player.Move_Speed = 200
	visible = false


func _on_restart_pressed():
	Ball.Restart()
