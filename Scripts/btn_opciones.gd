extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.on_btn_opt_pressed)
	
func on_btn_opt_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/menu_opt.tscn")

