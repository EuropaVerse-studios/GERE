extends Node

var bpm = 120
var sec_per_beat = 0.5
var song_offset = 0.0
var song_time = 0.0
var song_playing = false

@onready var audio_player = $AudioStreamPlayer

func start_song():
	audio_player.play()
	song_time = 0.0
	song_playing = true

func _process(delta):
	if song_playing:
		song_time += delta
