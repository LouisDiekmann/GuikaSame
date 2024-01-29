extends RigidBody2D
class_name Fruit

@onready var hasBeenCalled : bool = false
@export var fruit : int
var game : Game

func _on_body_entered(body):
	if fruit < 2:
		if body is Fruit and body.fruit == fruit:
			if not hasBeenCalled and not body.hasBeenCalled:
				hasBeenCalled = true
				game.instantiateNext(self, body)

