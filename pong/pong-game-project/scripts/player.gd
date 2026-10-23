extends StaticBody2D

# limites da tela
const LIMIT_X_MIN = 64
const LIMIT_X_MAX = 654

@export var player1 : bool
var player_speed : int = 500

func _process(delta: float):
	player_movement(delta)
	player_limits()
	
#funcao movimento propria 
func player_movement(delta: float) -> void:
	if player1:

		if Input.is_action_pressed("up1"):
			position.y -= player_speed * delta #delta para manter o movimento estavel
		elif Input.is_action_pressed("down1"):
			position.y += player_speed * delta
	#player2
	else: 
		if Input.is_action_pressed("up2"):
			position.y -= player_speed * delta
		elif Input.is_action_pressed("down2"):
			position.y += player_speed * delta

func player_limits() -> void:
	# impede que o jogador saia da tela
	# oq limitamos; lim min; lim max
	position.y = clamp(position.y, LIMIT_X_MIN, LIMIT_X_MAX) 
