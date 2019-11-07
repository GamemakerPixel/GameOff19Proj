extends Node2D

export (int) var chunkDistance = 10000
export (int) var platformDisBetween = 500
export (int) var percentPlatformFrequency = 100
var posQueue = [-1]
var currentChunkReach = 0

func _ready():
	runGenerationSequence(0, chunkDistance)

func runGenerationSequence(from, to):
	print("Generating from " + str(from) + " to " + str(to))
	currentChunkReach = to
	placeBoundries(from, to)
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
		print(pos)
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
		object.scale.x = rng.randi_range(5, 9)
		object.rotation_degrees = rng.randi_range(-10, 10)

func placeBoundries(from, to):
	var b1 = preload("res://GameOff19Proj/Boundries/BoundryFluid.tscn").instance()
	var b2 = preload("res://GameOff19Proj/Boundries/BoundryFluid.tscn").instance()
	b1.position = Vector2(to/2, 604)
	b2.position = Vector2(to/2, 904)
	b1.scale.x = chunkDistance/960
	b2.scale = b1.scale
	add

func _process(delta):
	if $Characters/Ball.position.x >= currentChunkReach - 2000:
		print("Preparing to generate from " + str(currentChunkReach) + " to " + str(currentChunkReach + chunkDistance))
		posQueue.append(-1)
		runGenerationSequence(currentChunkReach, currentChunkReach + chunkDistance)