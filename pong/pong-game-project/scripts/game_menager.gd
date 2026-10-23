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

@onready var pause: Control = $"../UI/pause"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	

# somente a bola se movimenta, entao nao é necessario especificar
func _on_goalpost_area_entered(area: Area2D) -> void:
	
	impact_goal_sound.play()
	player2_points += 1
	print("score player2")
	txt_score_p2.text = str(player2_points)
	
	ball.timer_controller()


func _on_goalpost_2_area_entered(area: Area2D) -> void:
	
	impact_goal_sound.play()
	player1_points += 1
	print("score player1")
	txt_score_p1.text = str(player1_points)
	
	ball.timer_controller()


func _on_resume_button_pressed() -> void:
	pause.visible = false
	get_tree().paused = false
