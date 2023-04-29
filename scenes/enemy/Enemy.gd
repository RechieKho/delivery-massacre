extends Area2D
class_name Enemy

export var knockback_magnitude := 1000
export var speed := 100
var health := 5
var player : Node2D
var velocity := Vector2.ZERO

func _ready():
	$AnimationPlayer.play("Walk")

func _process(delta):
	if player != null:
		velocity = lerp(velocity, 
			(player.global_position - global_position).normalized() * speed, 
			0.3)
	position += velocity * delta

func hurt(damage : int, knockback: Vector2):
	velocity += knockback
	health -= damage
	if health <= 0:
		queue_free()


func _on_Enemy_area_entered(area):
	if area is Player:
		area.hurt(5, velocity.normalized() * knockback_magnitude)
