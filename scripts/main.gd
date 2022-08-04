extends Node2D

class_name Main

onready var bird: KinematicBody2D = get_node("Bird")
onready var parallax_background: ParallaxBackground = get_node("ParallaxBackground")
onready var interface: CanvasLayer = get_node("Interface")
onready var ring_spawner: Position2D = get_node("RingSpawner")
onready var enemy_spawner: Position2D = get_node("EnemySpawner")
onready var sfx: AudioStreamPlayer = get_node("Sfx")

onready var background_speed_default : int = parallax_background.scenario_speed
onready var ring_speed_default : int = ring_spawner.ring_speed
onready var enemy_speed_default : int = enemy_spawner.enemy_speed


func _ready() -> void:
	var _start = interface.connect("start_game", self, "start_game")
	var _game_over = bird.connect("game_over", self, "game_over")
	sfx.play()



	

func start_game() -> void:
	bird.start()
	ring_spawner.start_spawn()
	enemy_spawner.start_spawn()
	

func game_over() -> void:
	sfx.stop()
	sfx.stream = load("res://assets/sfx/gameover.mp3")
	sfx.play()
	interface.game_over()
	parallax_background.game_over()
	ring_spawner.game_over()
	enemy_spawner.game_over()


func sfx_finished():
	sfx.play()


func increase_difficulty():
	var score : int = interface.score
	ring_spawner.ring_speed = ring_speed_default + (score)
	enemy_spawner.enemy_speed = enemy_speed_default + (score)
	parallax_background.scenario_speed = background_speed_default + (score)

