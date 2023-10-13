class_name Player extends CharacterBody3D

const SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var walking: bool

@onready var animation_player: AnimationPlayer = $Visuals/AnimationPlayer
@onready var visuals: Node3D = $Visuals
@onready var camera_point: Node3D = %CameraPoint


func _ready() -> void:
	GameManager.player = self


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED

		visuals.look_at(direction + position)

		if not walking:
			walking = true
			animation_player.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

		if walking:
			walking = false
			animation_player.play("idle")

	move_and_slide()
