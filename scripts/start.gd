extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "

export(PackedScene) var game
onready var main: Main = get_node("Main")
onready var main_index: int = get_node("Main").get_index()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AdMob.load_banner()
	$AdMob.show_banner()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reload_game() -> void:
	
	main.queue_free()
	main = game.instance()
	add_child(main)
	#move_child(main, main_index)

