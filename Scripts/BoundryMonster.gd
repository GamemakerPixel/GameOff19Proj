extends KinematicBody2D

var startSpeed = GlobalVariables.gameGenerationSettings[4]
var speed
var ready

func _ready():
	speed = startSpeed
	ready = false

func _process(delta):
	if ready:
		move_and_slide(Vector2(speed, 0))
		speed += GlobalVariables.gameGenerationSettings[5]

func _on_Collider_body_entered(body):
	if body.name == "Ball":
		if not body.onGameOver:
			body.get_node("CanvasLayer/GameOver").appear(body.score)
			body.onGameOver = true