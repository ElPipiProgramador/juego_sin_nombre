extends Button
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.on_button_pressed)

func on_button_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
