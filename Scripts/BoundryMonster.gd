extends KinematicBody2D

export (int) var startSpeed = 10
var speed
var ready

func _ready():
	speed = startSpeed
	ready = false

func _process(delta):
	if ready:
		move_and_slide(Vector2(speed, 0))
		speed += 0.3

func _on_Collider_body_entered(body):
	if body.name == "Ball":
		if not body.onGameOver:
			body.get_node("CanvasLayer/GameOver").appear(body.score)
			body.onGameOver = true