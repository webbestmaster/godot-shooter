extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/HBoxContainer/VBoxContainer/Label
@onready var grenade_label: Label = $LaserCounter/HBoxContainer/VBoxContainer2/Label
@onready var laser_icon: TextureRect = $LaserCounter/HBoxContainer/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $LaserCounter/HBoxContainer/VBoxContainer2/TextureRect
@onready var health_bar: TextureProgressBar = $TextureProgressBar

var green_color: Color = Color("00a287")
var red_color: Color = Color(0.9, 0, 0, 1)

func _ready():
	Globals.connect("state_change", update_state_text)
#	laser_label = $LaserCounter/HBoxContainer/VBoxContainer/Label
#	agrenade_label  = $LaserCounter/HBoxContainer/VBoxContainer2/Label
	print('READY')
	update_state_text()

func update_health_text():
	health_bar.value = Globals.health
	
func update_state_text():
	update_laset_text()
	update_grenade_text()
	update_health_text()

func update_laset_text():
	laser_label.text = str(Globals.laser_amount)
	if Globals.laser_amount > 5:
		laser_label.modulate = green_color
		laser_icon.modulate = green_color
	else:
		laser_label.modulate = red_color
		laser_icon.modulate = red_color
		
func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	if Globals.grenade_amount > 2:
		grenade_label.modulate = green_color
		grenade_icon.modulate = green_color
	else:
		grenade_label.modulate = red_color
		grenade_icon.modulate = red_color

