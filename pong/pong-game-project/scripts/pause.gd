extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func resume_func() -> void:
	get_tree().paused = false
	
func pause_func() -> void:
	get_tree().paused = true
	

func press_esc() -> void:
	
	if Input.is_action_just_pressed("pause") and get_tree().paused:
		resume_func()
	elif Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause_func()
