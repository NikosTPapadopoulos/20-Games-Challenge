extends CharacterBody2D

@export var Points : Node
@export var Sound: Node

func _ready():
	Points = get_node("/root/MainSceen/Points")
	Sound = get_node("/root/MainSceen/PointAudio")

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Points.points += 1
		Sound.playing = true
