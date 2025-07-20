extends Node2D

@onready var spawn_timer = $SpawnTimer
@export var ball_scene: PackedScene = preload("res://scenes/Ball.tscn")

func _ready():
    spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout():
    var ball = ball_scene.instantiate()
    ball.position = Vector2(randi() % 640, 0)
    add_child(ball)
