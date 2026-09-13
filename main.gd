extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Set this to the total number of collectibles you end up placing!
var items_left: int = 3

func _on_collectible_body_entered(body: Node2D) -> void:
	if "player" in body.name.to_lower() or body is CharacterBody2D:
		
		for child in get_children():
			if child is Area2D and child.overlaps_body(body):
				print("Successfully collected: ", child.name)
				
				# CHANGE THIS LINE BELOW:
				child.call_deferred("queue_free") 
				
				items_left -= 1
				print("Items remaining: ", items_left)
				
				if items_left <= 0:
					get_tree().change_scene_to_file("res://win_screen.tscn")
				
				break
