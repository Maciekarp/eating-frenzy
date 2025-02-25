extends RigidBody2D

var size: float = 0.5
@export var max_speed: float = 100
@export var accel_speed: float = 20
@export var reset_dist: float = 50

@export var default_sprite: Sprite2D


var swim_To: Vector2


func setSwimTo(new_swim_to: Vector2) -> void:
	swim_To = new_swim_to

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if global_position.distance_to(swim_To) < reset_dist:
		setSwimTo(Vector2(randf_range(-500, 500), randf_range(-300, 300)))
	apply_force((swim_To - global_position)* accel_speed)
	linear_velocity = linear_velocity.limit_length(max_speed)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if linear_velocity.x < 0:
		default_sprite.flip_h = true
	else:
		default_sprite.flip_h = false
	##if global_position.distance_to(swim_To) < reset_dist:
	##	setSwimTo(Vector2(randf_range(-500, 500), randf_range(-300, 300)))
	##global_position = global_position + global_position.direction_to(swim_To) * delta * move_speed
