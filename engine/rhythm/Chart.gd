extends Node

var notes = []

func load_chart(path):
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var data = JSON.parse(file.get_as_text())
		if data.error == OK:
			notes = data.result["notes"]
		file.close()
