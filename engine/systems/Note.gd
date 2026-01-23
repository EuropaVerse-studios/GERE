extends ColorRect

var speed = 200
var target_y = 600

func _process(delta):
	position.y += speed * delta
