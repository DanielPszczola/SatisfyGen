extends StaticBody2D

# Prosta sciana
@onready var shape: RectangleShape2D = $CollisionShape2D.shape

func _ready():
    update()

func _draw() -> void:
    var rect = Rect2(-shape.size/2, shape.size)
    draw_rect(rect, Color(0.6, 0.6, 0.6))
