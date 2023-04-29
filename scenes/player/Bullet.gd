extends Area2D

export var knockback_magnitude := 1000
var velocity := Vector2.ZERO

func _process(delta):
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_area_entered(area):
	if area is Enemy:
		area.hurt(1, velocity.normalized() * knockback_magnitude)
		queue_free()
