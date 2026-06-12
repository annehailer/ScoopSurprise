extends Control
class_name Main


var selected_cone: IngredientsList.CONES = IngredientsList.CONES.NULL

var current_icecream = {
	"cone":IngredientsList.CONES.NULL,
	"scoops": [],
	"topping": null
	}

var scoops_count = 0





func _ready():
	cone_sprite.texture = null
	topping_sprite.texture = null

var undo_cooldown: float = 0.5
var undo_timer: float = 0

func _process(delta: float) -> void:
	if undo_timer > 0:
		undo_timer -= delta

@onready var cone_sprite: TextureRect = $IceCreamDisplay/ConeSprite
func change_cone(cone_texture: Texture, cone_type: IngredientsList.CONES):
	selected_cone = cone_type
	current_icecream["cone"] = cone_type
	cone_sprite.texture = cone_texture

var scoop_scene = preload("res://entities/scoop.tscn")
@onready var scoops_container: Control = $IceCreamDisplay/ScoopsContainer

func add_icecream_ball(flavor_texture: Texture, flavor: IngredientsList.FLAVORS):
	if selected_cone == IngredientsList.CONES.NULL:
		return
	if scoops_count >= 3:
		return
	#print("tamo aqui: " + str(flavor_texture))
	var scoop = scoop_scene.instantiate()
	scoop.texture = flavor_texture
	current_icecream["scoops"].append(flavor)
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


@onready var topping_sprite: TextureRect = $IceCreamDisplay/ToppingSprite

func add_topping(topping_texture: Texture, topping: IngredientsList.TOPPINGS):
	if selected_cone == IngredientsList.CONES.NULL:
		return
	if scoops_count <= 0:
		return
	topping_sprite.texture = topping_texture
	
	update_toppings_pos()

func update_toppings_pos():
	if scoops_container.get_child_count() == 0:
		return
	
	var last_scoop = scoops_container.get_child(scoops_container.get_child_count() - 1)
	
	topping_sprite.position = last_scoop.position + Vector2(0, -10)


# ---------------------------------------- CLEAR ---------------------------------------------------

func clear_icecream():
	for scoop in scoops_container.get_children():
		scoop.queue_free()
	
	scoops_count = 0
	
	selected_cone = IngredientsList.CONES.NULL
	
	current_icecream = {
		"cone": IngredientsList.CONES.NULL,
		"scoops": []
	}
	
	cone_sprite.texture = null
	topping_sprite.texture = null


# teste (apertar enter pra sumir tudo)
func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		clear_icecream()

# ---------------------------------------- UNDO ----------------------------------------------------

func _on_undo_button_button_down():
	undo_last_action()

func undo_last_action():
	if undo_timer > 0:
		return
	undo_timer = undo_cooldown
	
	# remove a ultima bola
	if scoops_count > 0:
		var last_scoop: Scoop = scoops_container.get_child(
			scoops_container.get_child_count() - 1
		)
		
		last_scoop.pump_scale_back()
		
		scoops_count -= 1
		
		current_icecream["scoops"].pop_back()
		return
	
	# se nao tiver bolas, tira a casquinha
	if selected_cone != IngredientsList.CONES.NULL:
		
		selected_cone = IngredientsList.CONES.NULL
		
		current_icecream["cone"] = IngredientsList.CONES.NULL
		
		cone_sprite.texture = null
