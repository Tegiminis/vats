extends KinematicBody2D

var SPEED = 10000

onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	
	var vector = get_input_vector()
	
	move_and_slide(vector * (SPEED * delta))
	pass

func get_input_vector():
	var x = -(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	var y = -(Input.get_action_strength("move_up") - Input.get_action_strength("move_down"))
	
	return Vector2(x, y)

func shoot():
	animation.play("punch")
	pass
