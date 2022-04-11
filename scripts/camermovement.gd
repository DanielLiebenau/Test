extends Camera2D

export var speed = 100;
var velocity = Vector2()
var camera = Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process( delta):
	velocity = Vector2()
	camera = Camera2D
	velocity.x += 1
	velocity = velocity * speed * delta 
	global_position += velocity * delta
	speed += delta *100
	#print(velocity)
