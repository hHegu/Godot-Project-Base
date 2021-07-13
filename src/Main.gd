extends Node2D

onready var world = $World
onready var canvas_layer = $CanvasLayer

func _ready():
	GM.connect("on_level_changed", self, "on_level_changed")
	GM.connect("on_canvas_cleared", self, "on_canvas_cleared")
	GM.go_to_main_menu()

func on_level_changed(level: String):
	for n in world.get_children():
		world.remove_child(n)
		n.queue_free()

	var level_instance = load(level).instance()
	world.add_child(level_instance)

# Happens when going to the main menu
func on_canvas_cleared():
	for n in canvas_layer.get_children():
		canvas_layer.remove_child(n)
		n.queue_free()
