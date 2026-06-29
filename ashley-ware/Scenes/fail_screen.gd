extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		Global.minigames_done = 0
		Global.lives = 5
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
