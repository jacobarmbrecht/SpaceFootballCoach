extends Node3D

enum STATES{IDLE,PLAYING,RESETTING,HURT}
var cur_state = STATES.IDLE

@onready var body_mover = $BodyMover
@onready var nav : NavigationRegion3D = get_parent()

var play = Vector3(1,1,1)
var hike = false



# Called when the node enters the scene tree for the first time.
func _ready():
	set_state_idle()
	body_mover.init(self)


#for AI, we want to implement a simple state machine
func _process(delta):
	match cur_state:
		STATES.IDLE:
			process_state_idle(delta)
		STATES.PLAYING:
			process_state_playing(delta)
		STATES.RESETTING:
			process_state_resetting(delta)
		STATES.HURT:
			process_state_hurt(delta)
		

func set_state_idle():
	cur_state = STATES.IDLE
	
func set_state_playing():
	cur_state = STATES.PLAYING
	
func set_state_resetting():
	cur_state = STATES.RESETTING
	
func set_state_hurt():
	cur_state = STATES.HURT
	
func process_state_idle(delta):
	pass
	
func process_state_playing(delta):
	var goal_pos = play
	var our_pos = global_transform.origin
	var dir = our_pos.direction_to(goal_pos)
	
	
func process_state_resetting(delta):
	pass
	
func process_state_hurt(delta):
	pass
