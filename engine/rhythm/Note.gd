extends ColorRect

var speed = 300
var target_column = null

func _process(delta):
	if target_column:
		position.y += speed * delta  # usa position, non rect_position
		if position.y > target_column.position.y + target_column.rect_size.y:
			queue_free()
