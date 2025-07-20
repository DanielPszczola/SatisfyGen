extends RigidBody2D

# Rysowanie kulki i prosta logika zycia
@onready var shape: CircleShape2D = $CollisionShape2D.shape

func _ready():
    randomize()
    contact_monitor = true
    contacts_reported = 4
    connect("body_entered", _on_body_entered)
    update()

func _on_body_entered(body: Node) -> void:
    # Odtwarzanie prostego dzwieku klikniecia przy kolizji
    var tone = AudioStreamTone.new()
    tone.frequency = 880.0
    tone.length = 0.1
    tone.amplitude = 0.8
    var player = AudioStreamPlayer.new()
    player.stream = tone
    add_child(player)
    player.finished.connect(player.queue_free)
    player.play()

func _process(delta: float) -> void:
    if position.y > 500:
        queue_free()

func _draw() -> void:
    draw_circle(Vector2.ZERO, shape.radius, Color.WHITE)
