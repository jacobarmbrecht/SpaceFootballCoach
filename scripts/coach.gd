extends Node3D
@onready var clipboard = $CoachCam/Clipboard
@onready var camera = $CoachCam
@onready var view_type = 1

@export var mouse_sens = 0.5
@export var clipb_sens = 0.5
@export var clip_pos_start = Vector3(0,0,-0.5)
@export var clip_pos_end = Vector3(0,-0.75,-0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change_view"):
		view_type = view_type * -1 #toggle view
		clipboard.position = clip_pos_end
		#switch the pos now
		var temp = clip_pos_start
		clip_pos_start = clip_pos_end
		clip_pos_end = temp
	
func _input(event):
	if view_type == -1: #view check
		if event is InputEventMouseMotion: #allow freelook
			rotation_degrees.y -= mouse_sens * event.relative.x
			camera.rotation_degrees.x -= mouse_sens * event.relative.y
			camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
