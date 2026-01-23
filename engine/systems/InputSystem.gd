extends Node

var key_map = {
	"left": "ui_left",
	"down": "ui_down",
	"up": "ui_up",
	"right": "ui_right"
}

func _process(delta):
	for key in key_map.keys():
		if Input.is_action_just_pressed(key_map[key]):
			print("Pressed:", key)
