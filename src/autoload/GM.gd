extends Node

var main_menu_path := 'res://src/ui/MainMenu.tscn'

var level_folder_format := 'res://src/levels/{level}/{level}.tscn'
var ui_folder_format := 'res//src/ui/%s/%s.tscn'

var levels := {
	'MainMenu': "MainMenu",
	'Level1': 'Level1'
}

# String or null
var current_level = levels.MainMenu
var current_ui

signal on_level_changed
signal on_ui_changed
signal on_canvas_cleared


func go_to_main_menu():
	current_level = levels.MainMenu
	emit_signal("on_level_changed", level_folder_format.format({"level": current_level}))
	clear_main_canvas()


func clear_main_canvas():
	emit_signal("on_canvas_cleared")


func change_level(level: String):
	current_level = level
	emit_signal("on_level_changed", level_folder_format.format({"level": current_level}))


func change_ui(ui: String):
	current_ui = ui
	emit_signal("on_ui_changed",  ui_folder_format & current_ui)

