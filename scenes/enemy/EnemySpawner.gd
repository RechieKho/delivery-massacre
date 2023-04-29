extends Area2D


const enemy_resource := preload("res://scenes/enemy/Enemy.tscn")

export var player_path : NodePath
onready var spawner_range := $EnemySpawnerRange
onready var player := get_node(player_path)

func _on_SpawnTimer_timeout():
	var enemy = enemy_resource.instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	get_tree().current_scene.add_child(enemy)
	enemy.global_position = spawner_range.get_random_position()
	enemy.player = player
	enemy.self_modulate = Color(randf(), randf(), randf())
