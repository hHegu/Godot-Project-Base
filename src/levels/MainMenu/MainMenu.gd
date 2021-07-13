extends Control


func _on_StartGameButton_pressed():
	GM.change_level(GM.levels.Level1)


func _on_QuitButton_pressed():
	get_tree().quit()
