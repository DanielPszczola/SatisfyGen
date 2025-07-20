extends Node2D

# Timery sterujace generowaniem kulek i resetem sceny
@onready var spawn_timer = $SpawnTimer
@onready var reset_timer = $ResetTimer

# Sceny obiektow
@export var ball_scene: PackedScene = preload("res://scenes/Ball.tscn")
@export var ramp_scene: PackedScene = preload("res://scenes/Ramp.tscn")
@export var wall_scene: PackedScene = preload("res://scenes/Wall.tscn")

func _ready():
    randomize()
    spawn_timer.timeout.connect(_on_spawn_timer_timeout)
    reset_timer.timeout.connect(_on_reset_timer_timeout)
    _generate_layout()
    reset_timer.wait_time = randf_range(10.0, 15.0)

func _on_spawn_timer_timeout():
    var ball = ball_scene.instantiate()
    ball.position = Vector2(randi() % 640, 0)
    add_child(ball)

func _on_reset_timer_timeout():
    _clear_layout()
    _generate_layout()
    reset_timer.wait_time = randf_range(10.0, 15.0)

func _clear_layout():
    for child in get_children():
        if child is StaticBody2D or child is RigidBody2D:
            child.queue_free()

func _generate_layout():
    var left = wall_scene.instantiate()
    left.position = Vector2(0, 240)
    add_child(left)

    var right = wall_scene.instantiate()
    right.position = Vector2(640, 240)
    add_child(right)

    var floor = wall_scene.instantiate()
    floor.position = Vector2(320, 480)
    floor.rotation = deg_to_rad(90)
    add_child(floor)

    var count = randi() % 4 + 2
    for i in range(count):
        var ramp = ramp_scene.instantiate()
        ramp.position = Vector2(randf_range(50, 590), randf_range(200, 430))
        ramp.rotation = deg_to_rad(randf_range(-45, 45))
        add_child(ramp)
