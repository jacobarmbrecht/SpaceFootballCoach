extends Node3D
@onready var canvas = $CanvasLayer
@onready var screen = $clipboard/Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input_event(camera, event, position, normal, shape_idx):
	print("cl")
