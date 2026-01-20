extends Node2D

# === Collegamenti ai nodi ===
@onready var studio_label = $StudioLabel
@onready var powered_by_label = $PoweredByContainer/PoweredByLabel
@onready var godot_logo = $PoweredByContainer/GodotLogo
@onready var quote_label = $QuoteLabel
@onready var game_title_label = $GameTitleLabel
@onready var press_any_key_label = $PressAnyKeyLabel

# Lista di frasi
var quotes: Array = []

func _ready():
	# Nascondi tutto subito
	for node in [studio_label, powered_by_label, godot_logo, quote_label, game_title_label, press_any_key_label]:
		node.visible = false

	# Carica frasi dal file .txt
	var file = FileAccess.open("res://quotes.txt", FileAccess.READ)
	if file:
		quotes = file.get_as_text().split("\n")
		file.close()

	# Avvia la sequenza
	await start_sequence()


# === Sequenza di apparizione dei vari elementi ===
func start_sequence():
	# Studio Label
	await fade_in_then_out(studio_label, 0.5, 1.0, 0.5)

	# Powered by + Logo
	await fade_in_then_out(powered_by_label, 0.5, 1.0, 0.5)
	await fade_in_then_out(godot_logo, 0.5, 1.0, 0.5)

	# Frase casuale
	if quotes.size() > 0:
		var index = int(randi() % quotes.size())
		quote_label.text = quotes[index]
	await fade_in_then_out(quote_label, 0.5, 1.0, 0.5)

	# Nome del gioco
	await fade_in_then_out(game_title_label, 0.5, 1.0, 0.5)

	# Press any key (qui resta visibile fino a input)
	press_any_key_label.visible = true
	press_any_key_label.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(press_any_key_label, "modulate:a", 1.0, 0.5)


# === Funzione generica fade in → stay → fade out ===
func fade_in_then_out(node: CanvasItem, fade_in_time: float, stay_time: float, fade_out_time: float):
	node.visible = true
	node.modulate.a = 0.0
	var tw = create_tween()
	# Fade in
	tw.tween_property(node, "modulate:a", 1.0, fade_in_time)
	# Stay
	tw.tween_interval(stay_time)
	# Fade out
	tw.tween_property(node, "modulate:a", 0.0, fade_out_time)
	return await tw.finished


# === Rileva il tasto premuto ===
func _unhandled_input(event: InputEvent):
	if press_any_key_label.visible and event.is_pressed():
		get_tree().change_scene("res://MainScreen.tscn")
