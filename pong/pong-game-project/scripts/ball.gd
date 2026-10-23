extends Area2D

# parametros
const SPEED : int = 500
const START_POS : Vector2 = Vector2(640, 360) #armazena x y
var start_direction : Vector2 = Vector2(0, 0)
var new_direction : Vector2 = Vector2(0, 0)

# limites da tela
const LIMIT_Y_MIN : float = 0
const LIMIT_Y_MAX : float = 720
const LIMIT_X_MIN : float = 0
const LIMIT_X_MAX : float = 1280

# efeitos sonoros
@onready var impact_barrier_sound : AudioStreamPlayer = $impact_barrier_sound
@onready var impact_player_sound : AudioStreamPlayer = $impact_player_sound

# Timer
# onready cria timer somente quando for criada no jogo
@onready var timer : Timer = $Timer

func _ready() -> void:
	timer_controller()

func _process(delta: float) -> void:
	ball_movement(delta)
	colliding_barriers()


func timer_controller() -> void:
	timer.start()


func reset_ball() -> void:
	position = START_POS
	chosing_start_direction()
	
#implement: if player1 wins, go to player2 direction, vice-versa
func chosing_start_direction() -> void:
	# escolhe as direcoes horizontal e vertical
	var random_x = [-1, 1].pick_random()
	var random_y = [-1, 1].pick_random()
	
	# aplica as novas direcoes
	start_direction = Vector2(random_x, random_y)
	new_direction = start_direction


func ball_movement(delta: float) -> void:
	position += new_direction * SPEED * delta



func colliding_barriers() -> void:
	# impede que a bola saia da tela por cima ou por baixo
	if position.y >= LIMIT_Y_MAX or position.y <= LIMIT_Y_MIN:
		new_direction.y *= -1
		
		 # impede que o som toque quando a bola esta fora da tela
		if position.x >= LIMIT_X_MIN and position.x <= LIMIT_X_MAX:
			impact_barrier_sound.play()


# muda de direcao quando acerta um jogador
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		new_direction.x *= -1
		impact_barrier_sound.play()


func _on_timer_timeout() -> void:
	reset_ball()
