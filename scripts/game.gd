extends Control
class_name Game

@onready var cherry = preload("res://scenes/cherry.tscn")
@onready var strawberry = preload("res://scenes/strawberry.tscn")
@onready var fruitArray : Array = [cherry, strawberry]

func _input(_event):
	if Input.is_action_just_pressed("click"):
		instantiate(cherry, get_global_mouse_position())

func instantiateNext(collider, collidedWith):
	instantiate(fruitArray[collider.fruit], collider.position)
	collider.queue_free()
	collidedWith.queue_free()

func instantiate(fruitScene, pos):
	var instance = fruitScene.instantiate()
	instance.game = self
	instance.position = pos
	call_deferred("add_child", instance)
