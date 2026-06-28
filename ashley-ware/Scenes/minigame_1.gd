extends Node2D
@onready var anim = $Garlic/animation
@onready var themed_timer: Node2D = $ThemedTimer 
# ^^^ You dragged this in the scene by the way 



var garlic_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:
	anim.play("floating")

		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	
	if garlic_collected == 1: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") # go back to the intermission scene
	
	if timer_end:
		Global.lives -= 1
		if Global.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/fail_screen.tscn")
		else:
			Global.minigames_done -= 1
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func _on_garlic_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return
	
