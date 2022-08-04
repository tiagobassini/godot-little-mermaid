extends Position2D

signal game_over

onready var timer: Timer = get_node("Timer")



export(PackedScene) var ring_scene
export(float) var spawn_cooldown
export(int) var ring_speed
export(int) var ring_min_position
export(int) var ring_max_position

func start_spawn() -> void:
	timer.start(spawn_cooldown)


func spawn() -> void:
	var ring: Ring = ring_scene.instance()
	ring.set_speed(ring_speed)
	ring.global_position = random_position()
	var _game_over = connect("game_over", ring, "game_over")
	add_child(ring)
	timer.start(spawn_cooldown)
	


func random_position() -> Vector2:
	randomize()
	var random_number: float = rand_range(ring_min_position,ring_max_position)
	return Vector2(0, random_number)


func game_over() -> void:
	timer.stop()
	emit_signal("game_over")

func on_timer_timeout() -> void:
	spawn()

func update_speed() -> void:
	ring_speed += 100
	print("+ speed")

