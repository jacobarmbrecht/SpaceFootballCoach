extends Node3D

@onready var screen = $clipboard/Area3D
@onready var mesh = $clipboard


var screen_dim

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input_event(camera, event, position, normal, shape_idx):
	print("cl")
