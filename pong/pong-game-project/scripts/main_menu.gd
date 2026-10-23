extends Control

@onready var main_buttons: VBoxContainer = $main_buttons
@onready var help_panel: Panel = $help_panel
@onready var title: Label = $title


func _ready() -> void:
	main_buttons.visible = true
	help_panel.visible = false
	title.visible = true


func _process(delta: float) -> void:
	# mudar modo da janela com f11
	if Input.is_action_just_pressed("fullscreen"):
		# se em janela, tela cheia
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		# se tela cheia, janela
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	print("play")

func _on_help_button_pressed() -> void:
	main_buttons.visible = false
	help_panel.visible = true
	title.visible = false
	print("options")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	print("quit")

func _on_back_button_pressed() -> void:
	main_buttons.visible = true
	help_panel.visible = false
	title.visible = true
