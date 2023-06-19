extends CharacterBody3D


@onready var navigateAgent := $NavigationAgent3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	# Click and drag movement
	if Input.is_action_just_pressed("click"):
		# get camera
		var cam = get_tree().get_nodes_in_group("CoachCam")[0]
		var mousePos = get_viewport().get_mouse_position()
		# set ray length
		var rayLength = 100
		var from = cam.project_ray_origin(mousePos)
		var to = from + cam.project_ray_origin(mousePos) * rayLength
		var space = get_world_3d().direct_space_state
		# Build ray query 
		var rayQuery = PhysicsRayQueryParameters3D.new()
		rayQuery.from = from
		rayQuery.to = to
		
		var result = space.intersect_point(rayQuery)
		
		print(result)
