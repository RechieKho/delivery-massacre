extends Node2D

const bullet_resource := preload("res://scenes/player/Bullet.tscn")
const primary_color := [Color.red, Color.green, Color.blue]

export var speed := 500
onready var shoot_cooldown := $Timers/ShootCooldown
onready var graphics := $Graphics
onready var animation_player := $AnimationPlayer
var color_index := 0


func _process(delta):
	rotation = (get_global_mouse_position() - global_position).angle()

func shoot():
	if not shoot_cooldown.is_stopped(): return
	var bullet = bullet_resource.instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	get_tree().current_scene.add_child(bullet)
	bullet.velocity = (get_global_mouse_position() - global_position).normalized() * speed
	bullet.global_position = graphics.global_position
	bullet.self_modulate = primary_color[color_index]
	animation_player.play("Shoot")
	shoot_cooldown.start()

func next_color():
	color_index = (color_index + 1) % primary_color.size()
