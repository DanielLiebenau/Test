extends Node2D
export (Array, PackedScene) var scenes
var obstacle = preload("res://TileMap.tscn")
var max_obstacle = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(max_obstacle):
		var Obstacle_scene = obstacle.instance()
		Obstacle_scene.global_position = Vector2(888* (i+1),0)
		$Container.add_child(Obstacle_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
