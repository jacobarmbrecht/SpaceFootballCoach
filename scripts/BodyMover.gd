extends Node3D

var body_to_move : CharacterBody3D = null

@export var move_accel = 2
@export var max_speed = 10
@export var jump_force = 20
var gravity = 9.8
var drag = 0.0

var pressed_jump = false
var move_vec : Vector3
var velocity : Vector3
var snap_vec : Vector3

var frozen = false

signal movement_info

# Called when the node enters the scene tree for the first time.
func _ready():
	drag = float(move_accel) / max_speed

func init(_body_to_move: CharacterBody3D):
	body_to_move = _body_to_move

func jump():
	pressed_jump = true

func set_move_vec(_move_vec: Vector3):
	move_vec = _move_vec.normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if frozen:
		return
		
	var cur_move_vec = move_vec
	velocity += move_accel * cur_move_vec - velocity * Vector3(drag, 0, drag) + gravity * Vector3.DOWN * delta
	velocity = body_to_move.move_and_slide_with_snap(velocity, snap_vec, Vector3.UP)
	
	var grounded = body_to_move.is_on_floor()
	if grounded:
		velocity.y = -0.01
	if grounded and pressed_jump:
		velocity.y = jump_force
		snap_vec = Vector3.ZERO
	else:
		snap_vec = Vector3.DOWN
	pressed_jump = false
	emit_signal("movement_info", velocity, grounded)
