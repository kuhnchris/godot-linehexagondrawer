extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lineMover: Polygon2D
var lineA : Line2D
var lineB : Line2D
var lineC : Line2D
var speed: float = 2.5
var strahlen = []

# Called when the node enters the scene tree for the first time.
func _ready():
	lineMover = $LineMover
	lineA = $lineA
	lineB = $lineB
	lineC = $lineC

	# oben links
	strahlen.append({
		"dir": (lineA.points[1] - lineA.points[0]).normalized() * speed * rand_range(speed / 2,speed*2),
		"pos": (lineA.points[0] + lineA.points[1]) / 2
	})
	# oben rechts
	strahlen.append({
		"dir": (lineB.points[1] - lineB.points[0]).normalized() * speed * rand_range(speed / 2,speed*2),
		"pos": (lineB.points[0] + lineB.points[1]) / 2
	})
	# mitte rechts
	strahlen.append({
		"dir": (lineC.points[1] - lineC.points[0]).normalized() * speed * -1 * rand_range(speed / 2,speed*2),
		"pos": (lineC.points[0] + lineC.points[1]) / 2
	})

	# unten rechts
	strahlen.append({
		"dir": (lineA.points[1] - lineA.points[0]).normalized() * speed * -1 * rand_range(speed / 2,speed*2),
		"pos": (lineA.points[0] + lineA.points[1]) / 2
	})

	# unten links
	strahlen.append({
		"dir": (lineB.points[1] - lineB.points[0]).normalized() * speed * -1 * rand_range(speed / 2,speed*2),
		"pos": (lineB.points[0] + lineB.points[1]) / 2
	})

	# mitte links
	strahlen.append({
		"dir": (lineC.points[1] - lineC.points[0]).normalized() * speed * rand_range(speed / 2,speed*2),
		"pos": (lineC.points[0] + lineC.points[1]) / 2
	})
	#while lineMover.polygon.empty() != true:
		#lineMover.polygon.remove(0)

	#lineMover.clear_points()
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	#lineMover.add_point(Vector2(0,0))
	for i in range(strahlen.size()):
		lineMover.polygon.append(Vector2(0,0))
		strahlen[i]["initPos"] = strahlen[i]["pos"]

func _process(_delta):
	var f = PoolVector2Array()
	var c = PoolColorArray()
	for i in range(strahlen.size()):
		strahlen[i].pos = strahlen[i].pos + strahlen[i].dir
		f.append(strahlen[i].pos)
		c.append(Color.aquamarine)
		#lineMover.polygon[i] = strahlen[i].pos
	lineMover.polygon = f

	for i in range(strahlen.size()):
		if strahlen[i].pos.y > 500 || strahlen[i].pos.y < -0 || strahlen[i].pos.x < 0 || strahlen[i].pos.x > 500 || strahlen[i].pos.distance_to(strahlen[i].initPos) < .2:
			strahlen[i].dir = strahlen[i].dir * -1
	#lineMover.draw_polygon(f,c)

				
	#if lineMover.points[0] >= lineA.points[1] or lineMover.points[0] <= lineA.points[0]:
		#dirVectorA = dirVectorA * -1
		#dirVectorB = dirVectorB * -1		
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
