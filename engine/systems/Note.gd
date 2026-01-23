extends Node2D  # oppure ColorRect, va bene per demo

var speed = 300        # pixel al secondo
var column_pos = Vector2.ZERO  # posizione della colonna target
var hit_window = 0.15          # tolleranza per hit/miss

func _ready():
	position = column_pos  # spawn sulla colonna

func _process(delta):
	position.y += speed * delta
	if position.y > 700:  # fuori schermo
		queue_free()
