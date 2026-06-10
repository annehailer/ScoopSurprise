extends Control

var selected_cone = "normal"
var scoops_count = 0

var scoop_scene = preload("res://entities/scoop.tscn")
@onready var scoops_container: Control = $IceCreamDisplay/ScoopsContainer


# ------------------------------------------ CONES -------------------------------------------------

@onready var cone_sprite: TextureRect = $IceCreamDisplay/ConeSprite

var cones = {
	"normal":
	preload("res://assets/cones/cone_normal.png"),
	"chocolate":
	preload("res://assets/cones/cone_chocolate.png"),
	"milk":
	 preload("res://assets/cones/cone_milk.png"),
	"strawberry":
	preload("res://assets/cones/cone_strawberry.png")
}

# ----------------------------------------- FLAVORS ------------------------------------------------

var flavors = {
	"DoceDeLeite":
	preload("res://assets/flavors/flavor_DoceDeLeite.png"),
	"Strawberry":
	preload("res://assets/flavors/flavor_strawberry.png"),
	"Lime":
	 preload("res://assets/flavors/flavor_lime.png"),
	"Wine":
	preload("res://assets/flavors/flavor_wine.png"),
	"Bubblegum":
	preload("res://assets/flavors/flavor_bubblegum.png"),
	"Orange":
	preload("res://assets/flavors/flavor_orange.png")
}

# ------------------------------------- READY / PROCESS --------------------------------------------

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

# ------------------------------------------- BUTTONS (cones) --------------------------------------

func _on_normal_cone_button_pressed() -> void:
	selected_cone = "normal"
	cone_sprite.texture = cones["normal"]

func _on_chocolate_cone_button_pressed() -> void:
	selected_cone = "normal"
	cone_sprite.texture = cones["chocolate"]

func _on_milk_cone_button_pressed() -> void:
	selected_cone = ""
	cone_sprite.texture = cones["milk"]

func _on_strawberry_cone_button_pressed() -> void:
	selected_cone = ""
	cone_sprite.texture = cones["strawberry"]

# ------------------------------------------- BUTTONS (scoops) -------------------------------------

func _on_dulce_button_pressed() -> void:
	add_scoop(flavors["DoceDeLeite"])
	

func _on_strawberry_button_pressed() -> void:
	add_scoop(flavors["Strawberry"])
	

func _on_lemon_button_pressed() -> void:
	add_scoop(flavors["Lime"])
	

func _on_wine_button_pressed() -> void:
	add_scoop(flavors["Wine"])
	

func _on_bubblegum_button_pressed() -> void:
	add_scoop(flavors["Bubblegum"])
	

func _on_orange_button_pressed() -> void:
	add_scoop(flavors["Orange"])
	

# ADD SCOOP FUNC ----------------------------------------

func add_scoop(texture):
	if scoops_count >= 3:
		return
	
	var scoop = scoop_scene.instantiate()
	scoop.texture = texture
	
	match scoops_count:
		0:
			scoop.position = Vector2(0,0)
		1:
			scoop.position = Vector2(0,-30)
		2:
			scoop.position = Vector2(0,-60)
	
	scoops_container.add_child(scoop)
	
	scoops_count += 1

# --------------------------------------------------------------------------------------------------
