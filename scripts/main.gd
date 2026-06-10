extends Control
class_name Main


var selected_cone: IngredientsList.CONES = IngredientsList.CONES.NORMAL
var scoops_count = 0

var scoop_scene = preload("res://entities/scoop.tscn")
@onready var scoops_container: Control = $IceCreamDisplay/ScoopsContainer


@onready var cone_sprite: TextureRect = $IceCreamDisplay/ConeSprite
func change_cone(cone_texture: Texture, cone_type: IngredientsList.CONES):
	selected_cone = cone_type
	cone_sprite.texture = cone_texture


func add_icecream_ball(flavor_texture: Texture):
	if scoops_count >= 3:
		return
	#print("tamo aqui: " + str(flavor_texture))
	var scoop = scoop_scene.instantiate()
	scoop.texture = flavor_texture
	var scoop_behaviour: Scoop = scoop as Scoop
	scoop_behaviour.pump_scale()
	
	
	match scoops_count:
		0:
			scoop.position = Vector2(0,-7)
		1:
			scoop.position = Vector2(0,-39)
		2:
			scoop.position = Vector2(0,-71)
	
	scoops_container.add_child(scoop)
	
	scoops_count += 1
