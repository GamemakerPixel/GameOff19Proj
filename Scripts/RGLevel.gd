extends Node2D

export (int) var chunkDistance = 10000
var platformDisBetween = GlobalVariables.gameGenerationSettings[0]
var percentPlatformFrequency = GlobalVariables.gameGenerationSettings[1]
var posQueue = [-1]
var currentChunkReach = 0

func _ready():
	runGenerationSequence(0, chunkDistance)

func runGenerationSequence(from, to):
	currentChunkReach = to
	while posQueue.back() != platformDisBetween:
		if posQueue.back() == -1:
			posQueue.clear()
		var value
		if posQueue.size() > 0:
			value = posQueue.back() - platformDisBetween
		else:
			value = to - platformDisBetween
		if value >= from && value <= to:
			posQueue.append(value)
		else:
			break
	for pos in posQueue:
		generateForPos(pos)
		generateForPos(pos + platformDisBetween/2, "top")

func generateForPos(pos, height = "low"):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if rng.randi_range(1, 100) <= percentPlatformFrequency:
		var object = preload("res://GameOff19Proj/Platforms/Normal.tscn").instance()
		$Platforms.add_child(object)
		if height == "top":
			object.position = Vector2(pos, 804)
		else:
			object.position = Vector2(pos, 504)
		object.scale.x = rng.randi_range(GlobalVariables.gameGenerationSettings[2], GlobalVariables.gameGenerationSettings[2] + 4)
		object.rotation_degrees = rng.randi_range(-GlobalVariables.gameGenerationSettings[3], GlobalVariables.gameGenerationSettings[3])

#Removed
#func placeBoundries(from, to):
	#var b1 = preload("res://GameOff19Proj/Boundries/BoundryFluid.tscn").instance()
	#var b2 = preload("res://GameOff19Proj/Boundries/BoundryFluid.tscn").instance()
	#b1.position = Vector2(to/2, 404)
	#b2.position = Vector2(to/2, 904)
	##b1.scale.x = chunkDistance/480
	##b2.scale = b1.scale
	#b1.rotation_degrees = 180
	#$Boundries.add_child(b1)
	#$Boundries.add_child(b2)

func _process(delta):
	if $Characters/Ball.position.x >= currentChunkReach - 2000:
		posQueue.append(-1)
		runGenerationSequence(currentChunkReach, currentChunkReach + chunkDistance)

func reset():
	$Characters/BoundryMonster.ready = false
	$Characters/BoundryMonster.speed = $Characters/BoundryMonster.startSpeed
	$Characters/BoundryMonster.position.x = -5000
	$Characters/Ball/CanvasLayer/ColorRect.color = Color8(255, 15, 15, 0)
	$Characters/Ball.position = Vector2(400, 654)
	print("RESET")
	for child in $Platforms.get_children():
		child.queue_free()
	runGenerationSequence(0, chunkDistance)
	$Characters/Ball/CanvasLayer/GameOver.disappear()
	print($Characters/Ball.position)