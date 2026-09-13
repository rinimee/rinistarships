extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	# finds where the audio is
	var master_bus = AudioServer.get_bus_index("Master")
	
	# toggles the audio im so smart guyzz
	var is_muted = AudioServer.is_bus_mute(master_bus)
	AudioServer.set_bus_mute(master_bus, not is_muted)
