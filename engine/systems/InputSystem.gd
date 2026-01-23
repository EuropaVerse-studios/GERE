var key_map = {
	"ui_left": 0,
	"ui_down": 1,
	"ui_up": 2,
	"ui_right": 3
}

func _process(delta):
	for action in key_map.keys():
		if Input.is_action_just_pressed(action):
			check_hit(key_map[action])

func check_hit(column_index):
	var col = columns[column_index]
	for note in get_children():
		if note is ColorRect and note.target_column == col:
			if note.rect_position.y > col.rect_size.y - 50 and note.rect_position.y < col.rect_size.y:
				print("Hit!")
				note.queue_free()
				return
	print("Miss!")
