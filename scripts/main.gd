extends Node2D

@export var fish_instance: Resource

var allFish: Array[Node] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func _input(event):
    if event.is_action_pressed("click"):
        #spawn fish at position
        var tempFish = fish_instance.instantiate()
        tempFish.global_position = get_global_mouse_position()
        if tempFish.has_method("setSwimTo"):
            tempFish.setSwimTo(Vector2(randf_range(-500, 500), randf_range(-300, 300)))
        else:
            print(fish_instance.resource_name + " fish_instance does not have setSwimTo method")
        allFish.append(tempFish)
        add_child(tempFish)


func _on_player_eaten(other: Node) -> void:
    allFish.erase(other)
    other.queue_free()
    print("eaten ", other)


func _on_player_got_eaten(other: Node) -> void:
    print("got eaten by ", other)
