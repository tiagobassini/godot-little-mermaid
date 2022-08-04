extends Position2D

signal game_over

onready var timer: Timer = get_node("Timer")

export(PackedScene) var enemy_scene
export(float) var spawn_cooldown_min
export(float) var spawn_cooldown_max
export(int) var enemy_speed
export(int) var enemy_min_position
export(int) var enemy_max_position


func start_spawn() -> void:
	timer.start(random_cooldown())

func spawn() -> void:
	var enemy: Enemy = enemy_scene.instance()
	enemy.set_speed(enemy_speed)
	enemy.global_position = random_position()
	var _game_over = connect("game_over", enemy, "game_over")
	add_child(enemy)
	timer.start(random_cooldown())
	


func random_cooldown() -> float :
	randomize()
	var cooldown: float = rand_range(spawn_cooldown_min, spawn_cooldown_max )
	return cooldown

func random_position() -> Vector2:
	randomize()
	var random_number: float = rand_range(enemy_min_position,enemy_max_position)
	return Vector2(0, random_number)


func game_over() -> void:
	timer.stop()
	emit_signal("game_over")

func on_timer_timeout() -> void:
	spawn()

