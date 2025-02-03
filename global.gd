extends Node
var current_scene
func change_scene(current_scene,scene_path: String):
	if current_scene:
		current_scene.queue_free()  # Remove the current scene properly
	
	var new_scene = load(scene_path).instantiate()
	
	if new_scene:
		get_tree().current_scene = new_scene  # Assign the new scene to the scene tree
		add_child(new_scene)
		current_scene = new_scene
	else:
		print("Error loading scene: " + scene_path)
	
