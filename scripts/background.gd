extends ParallaxBackground


onready var background_texture: TextureRect = get_node("Background/Texture")
onready var background_layer: ParallaxLayer = get_node("Background")
onready var floor_layer: ParallaxLayer = get_node("Floor")

export(int) var scenario_speed
export(Array, String) var scenario_texture

func _ready() -> void:
	randomize()
	var random_number: int = randi() % scenario_texture.size()
	background_texture.texture = load(scenario_texture[random_number])
	

func _physics_process(delta: float) -> void:
	background_layer.motion_offset.x -= scenario_speed/3 * delta
	floor_layer.motion_offset.x -= scenario_speed * delta
	
func game_over() -> void:
	set_physics_process(false)

func update_speed() -> void:
	print("teste parallax")


