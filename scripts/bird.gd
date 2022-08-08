extends KinematicBody2D

class_name Bird

signal game_over

var velocity: Vector2
var can_interact: bool = true

onready var animation: AnimatedSprite = get_node("Texture")

export(PackedScene) var sfx_scene

export(int) var gravity_speed
export(int) var jump_speed


func _ready()-> void:
	#animation.play("fly")
	set_physics_process(false)
	


func _physics_process(delta) -> void :
	velocity.y += gravity_speed * delta
	if velocity.y > gravity_speed :
		velocity.y = gravity_speed

	if Input.is_action_just_pressed("ui_select") and can_interact:
		spawn_sfx("res://assets/sfx/swoosh.ogg")
		velocity.y = jump_speed
	
	velocity = move_and_slide(velocity)

func start() -> void:
	animation.play("fly")
	set_physics_process(true)


func on_body_entered(body: Object) -> void:
	if body.name != "Bird" && body.name!= "Sky" && can_interact:
		velocity.x=0
		spawn_sfx("res://assets/sfx/hit.ogg")
		animation.play("hit")
		can_interact=false
		emit_signal("game_over")
	

func spawn_sfx(effect: String) -> void:
	var sfx: SoundEffect = sfx_scene.instance() 
	sfx.stream = load(effect)
	get_tree().root.call_deferred("add_child", sfx)


func button_pressed() -> void:
	if can_interact :
		spawn_sfx("res://assets/sfx/swoosh.ogg")
		velocity.y = jump_speed



