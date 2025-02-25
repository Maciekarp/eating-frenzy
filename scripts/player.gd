extends Node2D

signal eaten(other:Node)
signal got_eaten(other:Node)

var size: float = 1

@export var move_speed: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move up"):
		global_position = global_position + delta * Vector2(0,-1) * move_speed
	if Input.is_action_pressed("move down"):
		global_position = global_position + delta * Vector2(0,1) * move_speed
	if Input.is_action_pressed("move left"):
		global_position = global_position + delta * Vector2(-1,0) * move_speed
	if Input.is_action_pressed("move right"):
		global_position = global_position + delta * Vector2(1,0) * move_speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().size <= size:
		#eat
		eaten.emit(area.get_parent())
		pass
	else:
		#get eaten
		got_eaten.emit(area.get_parent())
		pass
	pass # Replace with function body.
