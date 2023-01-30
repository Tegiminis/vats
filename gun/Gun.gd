extends Node2D
export (PackedScene) var Bullet

export var damage = 10		# damage per bullet
export var refire = 0.5 	# how quickly this gun refires
var cooldown = 0			# oooldown tracker

var cone = 0	# accuracy cone
export var spread = 15		# max cone size
export var stability = 1	# how quickly the weapon's accuracy stabilizes
export var recoil = 0	# how much recoil in cone angle is incurred with each shot

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		shoot()
	cone = clamp(cone - (stability * delta), 0, spread)
	cooldown = max(0, cooldown - delta)
	

func shoot():
	print(cooldown)
	if cooldown <= 0.0: 
		spawn_bullet($Muzzle.global_transform)
		cone += recoil
		cooldown = refire

func spread_calc(base):
	var val = randf() * cone
	return (base - cone / 2) + val 

func spawn_bullet(loc):
	var b = Bullet.instance()
	var worldspace = get_tree().get_root()
	worldspace.add_child(b)
	b.transform = loc
	b.rotation_degrees = spread_calc(b.rotation_degrees)
	
