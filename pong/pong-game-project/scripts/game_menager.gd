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

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	

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

# mudar modo da janela com f11
func fullscreen_func() -> void:

	if Input.is_action_just_pressed("fullscreen"):
		# se em janela, tela cheia
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		# se tela cheia, janela
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
