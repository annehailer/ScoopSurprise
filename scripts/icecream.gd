extends Node
class_name IceCream

var cone: IngredientsList.CONES
var scoops: Array[IngredientsList.FLAVORS]
var toppings = null

func _init() -> void:
	cone = IngredientsList.CONES.NULL
	scoops = []
