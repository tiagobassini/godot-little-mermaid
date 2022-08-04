extends Node2D

class_name Enemy


export(int) var walk_speed
onready var damage_area: StaticBody2D = get_node("DamageArea")
onready var animation: AnimatedSprite = get_node("Texture")


func _physics_process(delta: float) -> void:
	position.x -= delta * walk_speed


func on_screen_exited() -> void:
	queue_free()



func on_body_entered(body):
	if body is Bird :
		animation.play("attack")

func set_speed(speed: int) -> void:
	walk_speed = speed

func game_over() -> void:
	damage_area.get_node("Collision").set_deferred("disabled", true)
	set_physics_process(false)


func on_animation_finished():

	if animation.animation == "attack" :
		animation.play("default")
