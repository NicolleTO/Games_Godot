extends Control

var GameMenager = preload("res://scripts/game_menager.gd")
var game_menager = GameMenager.new()

@onready var main_buttons: VBoxContainer = $main_buttons
@onready var help_panel: Panel = $help_panel
@onready var title: Label = $title


func _ready() -> void:
	main_buttons.visible = true
	help_panel.visible = false
	title.visible = true


func _process(delta: float) -> void:
	game_menager.fullscreen_func()

# iniciar jogo
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	print("play")

# tela de ajuda (mostra os controles do jogo)
func _on_help_button_pressed() -> void:
	main_buttons.visible = false
	help_panel.visible = true
	title.visible = false
	print("options")

# fechar tela de ajuda
func _on_back_button_pressed() -> void:
	main_buttons.visible = true
	help_panel.visible = false
	title.visible = true

# sair
func _on_quit_button_pressed() -> void:
	get_tree().quit()
	print("quit")
