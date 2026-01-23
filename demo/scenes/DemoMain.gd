extends Node2D

@onready var chart = $Chart
@onready var conductor = $Conductor

var note_scene = preload("res://engine/rhythm/Note.tscn")  # prefab nota

func spawn_note(column_node):
	var note = note_scene.instantiate()
	note.column_pos = column_node.position
	add_child(note)
