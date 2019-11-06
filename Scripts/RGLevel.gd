extends Node2D

export (int) var distance = 10000
export (int) var platformDisBetween = 500
export (int) var percentPlatformFrequency = 100

var posQueue = [0]

func _ready():
	print("READY")
	runGenerationSequence()

func runGenerationSequence():
	while posQueue.back() != platformDisBetween:
		if posQueue.back() == 0:
			posQueue.remove(posQueue.find(0))
		var value
		if posQueue.size() > 0:
			value = posQueue.back() - platformDisBetween
		else:
			value = distance - platformDisBetween
		posQueue.append(value)
	for pos in posQueue:
		print(pos)
		generateForPos(pos)
		generateForPos(pos + platformDisBetween/2, "top")

func generateForPos(pos, height = "low"):
	print("Generate for pos " + str(pos))
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
		print("Place " + str(object) + " at pos " + str(pos))