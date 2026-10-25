extends Node2D

#bola
@onready var ball : Area2D = $"../ball"

# efeitos sonoros
@onready var impact_goal_sound : AudioStreamPlayer = $impact_goalpost_sound

# pontuacoes
var player1_points: int = 0
var player2_points: int = 0

#UI
@onready var txt_score_p1 : Label = $"../UI/score/text_score_p1"
@onready var txt_score_p2 : Label = $"../UI/score/text_score_p2"
@onready var pause_panel: Panel = $"../UI/score/pause_panel"

func _ready() -> void:
	# avisa que o node deve ser processado SEMPRE
	# tbm da para mudar direto no Inspector
	process_mode = Node.PROCESS_MODE_ALWAYS 
	resume_func()

func _process(delta: float) -> void:
	press_esc()
	fullscreen_func()
	
	
# ------------ Funções de Pontuação ------------

# somente a bola se movimenta, entao nao é necessario especificar
# gol jogador 1 (jogador 2 marca)
func _on_goalpost_area_entered(area: Area2D) -> void:
	
	impact_goal_sound.play()
	player2_points += 1
	print("score player2")
	txt_score_p2.text = str(player2_points)
	
	ball.timer_controller()

# gol jogador 2 (jogador 1 marca)
func _on_goalpost_2_area_entered(area: Area2D) -> void:
	
	impact_goal_sound.play()
	player1_points += 1
	print("score player1")
	txt_score_p1.text = str(player1_points)
	
	ball.timer_controller()


# ------------ Função Tela Cheia ------------
# mudar modo da janela com f11
func fullscreen_func() -> void:

	if Input.is_action_just_pressed("fullscreen"):
		# se em janela, tela cheia
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		# se tela cheia, janela
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


# ------------ Funções de Pause ------------
func resume_func() -> void:
	get_tree().paused = false
	pause_panel.hide()
	
func pause_func() -> void:
	get_tree().paused = true
	pause_panel.show()
	
func press_esc() -> void:
	
	if Input.is_action_just_pressed("pause") and get_tree().paused:
		resume_func()
		print("resume")
	elif Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause_func()
		print("pause")

func _on_resume_button_pressed() -> void:
	resume_func()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
