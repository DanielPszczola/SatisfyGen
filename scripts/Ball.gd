extends RigidBody2D

# Rysowanie kulki i prosta logika zycia
@onready var shape: CircleShape2D = $CollisionShape2D.shape

func _ready():
    randomize()
    connect("body_entered", _on_body_entered)
    update()

func _on_body_entered(body: Node) -> void:
    pass  # brak dzwieku

func _process(delta: float) -> void:
    if position.y > 500:
        queue_free()

func _draw() -> void:
    draw_circle(Vector2.ZERO, shape.radius, Color.WHITE)
