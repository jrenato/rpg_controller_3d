class_name CameraRig extends Node3D

@onready var background_viewport: SubViewport = %BackgroundViewport
@onready var foreground_viewport: SubViewport = %ForegroundViewport
@onready var background_camera: Camera3D = %BackgroundCamera
@onready var foreground_camera: Camera3D = %ForegroundCamera


func _ready() -> void:
	resize()


func _process(delta: float) -> void:
	background_camera.global_transform = GameManager.player.camera_point.global_transform
	foreground_camera.global_transform = GameManager.player.camera_point.global_transform


func resize() -> void:
	background_viewport.size = DisplayServer.window_get_size()
	foreground_viewport.size = DisplayServer.window_get_size()
