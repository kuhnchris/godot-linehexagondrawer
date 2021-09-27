extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lineMover: Line2D
var lineA : Line2D
var lineB : Line2D
var lineC : Line2D
var dirVectorA: Vector2
var dirVectorB: Vector2
var speed: float = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	lineMover = $LineMover
	lineA = $lineA
	lineB = $lineB
	lineC = $lineC
	lineMover.points[0] = lineA.points[0]
	lineMover.points[1] = lineB.points[0]
	dirVectorA = lineA.points[1] - lineA.points[0]
	dirVectorB = lineB.points[1] - lineB.points[0]
	dirVectorA = dirVectorA.normalized() * speed
	dirVectorB = dirVectorB.normalized() * speed
	pass # Replace with function body.

func _process(_delta):
	lineMover.points[0] = lineMover.points[0] + dirVectorA
	lineMover.points[1] = lineMover.points[1] + dirVectorB
	if lineMover.points[0] >= lineA.points[1] or lineMover.points[0] <= lineA.points[0]:
		dirVectorA = dirVectorA * -1
		dirVectorB = dirVectorB * -1		
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
