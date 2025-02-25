extends Node2D

var size: float = 0.5

@export var move_speed:float = 50
@export var reset_dist:float = 50 


var swim_To: Vector2


func setSwimTo(new_swim_to: Vector2) -> void:
	swim_To = new_swim_to

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.distance_to(swim_To) < reset_dist:
		setSwimTo(Vector2(randf_range(-500, 500), randf_range(-300, 300)))
	global_position = global_position + global_position.direction_to(swim_To) * delta * move_speed
