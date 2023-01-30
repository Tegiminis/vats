extends KinematicBody2D

var SPEED = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var vector = get_input_vector()
	move_and_slide(vector * (SPEED * delta))
	pass

func get_input_vector():
	var x = -(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	var y = -(Input.get_action_strength("move_up") - Input.get_action_strength("move_down"))
	
	return Vector2(x, y)
