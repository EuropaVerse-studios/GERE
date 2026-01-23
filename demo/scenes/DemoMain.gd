extends Node2D

# colonne
@onready var columns = [
	$ColumnLeft,
	$ColumnDown,
	$ColumnUp,
	$ColumnRight
]

var note_scene = preload("res://engine/rhythm/Note.tscn")

# chart demo
var chart_notes = [
	{"time": 0.1, "column": 0},
	{"time": 0.2, "column": 1},
	{"time": 0.3, "column": 2},
	{"time": 0.4, "column": 3},
]

var song_time = 0.0

func _process(delta):
	song_time += delta
	for note in chart_notes:
		if not note.has("spawned") and song_time >= note["time"]:
			spawn_note(note["column"])
			note["spawned"] = true

func spawn_note(column_index):
	var note_instance = note_scene.instantiate()  # crea istanza della scena
	note_instance.target_column = columns[column_index]
	note_instance.color = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW][column_index]
	note_instance.position = Vector2(columns[column_index].position.x, 0)  # Usa .position non .rect_position
	add_child(note_instance)


var key_map = {
	"ui_left": 0,
	"ui_down": 1,
	"ui_up": 2,
	"ui_right": 3
}

func handle_input():
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
