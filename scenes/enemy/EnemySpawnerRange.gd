extends CollisionShape2D
class_name EnemySpawnerRange


func _ready():
	assert(shape is RectangleShape2D, "Shape is not rectangle in EnemySpawnerRange.")


func get_random_position() -> Vector2:
	return Vector2(
		rand_range(global_position.x - shape.extents.x, global_position.x + shape.extents.x),
		rand_range(global_position.y - shape.extents.y, global_position.y + shape.extents.y)
	)
