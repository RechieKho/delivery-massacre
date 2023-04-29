extends Area2D
class_name Player

signal on_dead

export var speed := 500
onready var gun := $Gun
var health := 10
onready var animation_tree := $AnimationTree
var velocity := Vector2.ZERO

func _process(delta):
	velocity = lerp(velocity, Input.get_vector(
		"ui_left", "ui_right",
		"ui_up", "ui_down"
	) * speed, 0.4)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		gun.shoot()
	
	animation_tree.set("parameters/blend_position", velocity.length_squared() / (speed * speed))
	
	position += velocity * delta

func hurt(damage: int, knockback: Vector2):
	velocity += knockback
	health -= damage
	if health <= 0:
		get_tree().change_scene("res://scenes/end/Control.tscn")
