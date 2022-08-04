extends Node2D

class_name Ring


export(int) var walk_speed
onready var score_area: Area2D = get_node("ScoreArea")
onready var animation: AnimationPlayer = get_node("Animation")

func _ready():
	animation.play("Idle")

func _physics_process(delta: float) -> void:
	position.x -= delta * walk_speed


func on_screen_exited() -> void:
	queue_free()



func on_body_entered(body):
	if body is Bird :
		# dar play no audio
		queue_free()
		get_tree().call_group("Interface", "update_score")
		get_tree().call_group("Difficulty", "increase_difficulty")
		
		
		
		

func set_speed(speed: int) -> void:
	walk_speed = speed

func game_over() -> void:
	score_area.get_node("Collision").set_deferred("disabled", true)
	set_physics_process(false)
