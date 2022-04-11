extends KinematicBody2D
export var max_speed = 500
var  fall_gravity_scale = 150.0
export var gravity_scale = 100.0
var earth_gravity = 9.807
var jump_force = 500.0
var fallMultiplier = 2
var lowJumpMultiplier = 10
var jumpVelocity =  400

var speed = 100
var ACCELERATION = 0.5
var DECELERATION = 0.5



onready var animatedSprite = $AnimatedSprite
func ready():
	set_physics_process(true)
	

#func _process(delta):
#	pass


var velocity = Vector2()

func get_input():
	pass



var jump_released = false
var on_floor = velocity.y == 0
var max_jump_height = -500
var is_falling = false
var friction = 0.05 #Reibung
var double_jump = 2
func _physics_process(delta):
	
	if !is_on_floor():
		velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta 
		#if velocity.y > 0:
			#velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta
	else:
		velocity.y = 0
	
	if is_on_floor(): #Resets double jump when touching the floor
		double_jump = 2
	if Input.is_action_pressed("right") and velocity.x < max_speed:
		velocity.x += 1 * speed * ACCELERATION
	if Input.is_action_pressed("left") and velocity.x > -max_speed:
		velocity.x -= 1 * speed * ACCELERATION
	if Input.is_action_just_pressed("jump") and velocity.y > max_jump_height and is_on_floor():
		velocity.y = -1 * jump_force
	if Input.is_action_just_pressed("jump") and double_jump > 0:
			velocity.y = -1 * jump_force
			double_jump -= 1
			
	var axisX= Input.get_action_strength("right") - Input.get_action_strength("left")
	
	
	#Animation Logic
	if axisX > 0 and is_on_floor():
		animatedSprite.animation = "run"
		animatedSprite.flip_h = false
	elif axisX < 0 and is_on_floor():
		animatedSprite.animation = "run"
		animatedSprite.flip_h = true
	elif !is_on_floor() and axisX < 0:
		animatedSprite.animation = "jump"
		animatedSprite.flip_h = true;
	elif !is_on_floor() and axisX > 0:
		animatedSprite.animation = "jump"
		animatedSprite.flip_h = false;
	elif !is_on_floor():
		animatedSprite.animation = "jump"
	else:
		animatedSprite.animation = "idle"
	
	
	
	
	
	if not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("jump"):
		velocity.x = lerp(velocity.x, 0, DECELERATION)

	
	move_and_slide(velocity, Vector2.UP) 
	
	print(velocity)
	
	
	

