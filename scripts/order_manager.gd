extends Node2D
class_name OrderManager

var current_order: IceCream
var current_customer: CustomerList.CUSTOMER_TYPE

@onready var order_cone: TextureRect = $"../OrderDisplay/OrderCone"
@onready var order_scoop1: TextureRect = $"../OrderDisplay/OrderScoop1"
@onready var order_scoop2: TextureRect = $"../OrderDisplay/OrderScoop2"
@onready var order_scoop3: TextureRect = $"../OrderDisplay/OrderScoop3"
@onready var order_topping: TextureRect = $"../OrderDisplay/OrderTopping"


@onready var customer_sprite: TextureRect = $"../CustomerSprite"
@onready var order_label: Label = $"../OrderLabel"




func _ready() -> void:
	randomize()
	current_order = IceCream.new()
	generate_order()

func generate_order():
	current_order = IceCream.new()
	current_order.cone = randi_range(
		0,
		IngredientsList.CONES.NULL - 1
	)
	
	var scoop_amount = randi_range(1, 3)
	
	for i in scoop_amount:
		current_order.scoops.append(
			randi_range(
				0,
				IngredientsList.FLAVORS.NULL - 1
			)
		)
	print_order()
	display_order()

func print_order():
	print("-----PEDIDO-----")
	print("Cone:", current_order.cone)
	print("Scoops:", current_order.scoops)
	print("----------------------")

func check_order(player_icecream: IceCream) -> bool:
	if player_icecream.cone != current_order.cone:
		return false
	if player_icecream.scoops.size() != current_order.scoops.size():
		return false
	for i in range(player_icecream.scoops.size()):
		if player_icecream.scoops[i] != current_order.scoops[i]:
			return false
	return true


func display_order():
	order_cone.texture = null
	
	order_scoop1.texture = null
	order_scoop2.texture = null
	order_scoop3.texture = null
	order_topping.texture = null
	
	order_cone.texture = IngredientsList.get_cone_texture(current_order.cone)
	
	if current_order.scoops.size() >= 1:
		order_scoop1.texture = IngredientsList.get_flavor_texture(current_order.scoops[0])
	
	if current_order.scoops.size() >= 2:
		order_scoop2.texture = IngredientsList.get_flavor_texture(current_order.scoops[1])
	
	if current_order.scoops.size() >= 3:
		order_scoop3.texture = IngredientsList.get_flavor_texture(current_order.scoops[2])

func generate_customer():
	current_customer = randi_range(0,2)

func generate_real_order():
	current_order = IceCream.new()
	
	current_order.cone = randi_range(
		0,
		IngredientsList.CONES.NULL - 1
	)
	
	var scoop_amount = randi_range(1, 3)
	
	for i in scoop_amount:
		current_order.scoops.append(
			randi_range(
				0,
				IngredientsList.FLAVORS.NULL - 1
			)
		)

func get_spoken_order() -> IceCream:
	var spoken_order = IceCream.new()
	spoken_order.cone = current_order.cone
	spoken_order.scoops = current_order.scoops.duplicate()
	
	#  ---------------------------------------------------------------  PEIXE (mente sabor)
	if current_customer == CustomerList.CUSTOMER_TYPE.FISH:
		spoken_order.scoops[0] = randi_range(
			0,
			IngredientsList.FALVORS.NULL - 1
		)
	
	while spoken_order.scoops[0] == current_order.scoops[0]:
		spoken_order.scoops[0] = randi_range(
			0,
			IngredientsList.FLAVORS.NULL - 1
		)
	
	#  ---------------------------------------------------------------  POLVO (mente quantidade)
	
	if current_customer == CustomerList.CUSTOMER_TYPE.OCTOPUS:
		spoken_order.scoops.reverse()
	
	#  ---------------------------------------------------------------  TUBARAO (mente casquinha)
	
	if current_customer == CustomerList.CUSTOMER_TYPE.SHARK:
		spoken_order.cone = randi_range(
			0,
			IngredientsList.CONES.NULL - 1
		)
	
	while spoken_order.cone == current_order.cone:
		spoken_order.cone = randi_range(
			0,
			IngredientsList.CONER.NULL - 1
		)
	
	return spoken_order


func update_customer_sprite():
	match  current_customer:
		CustomerList.CUSTOMER_TYPE.FISH:
			customer_sprite.texture = CustomerList.CUSTOMER_FISH.texture
			
		CustomerList.CUSTOMER_TYPE.OCTOPUS:
			customer_sprite.texture = CustomerList.CUSTOMER_OCTOPUS.texture
			
		CustomerList.CUSTOMER_TYPE.SHARK:
			customer_sprite.texture = CustomerList.CUSTOMER_SHARK.texture


func animate_custumer_in():
	customer_sprite.position.y = 500
	
	var tween = create_tween()
	
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(
		customer_sprite,
		"position:y",
		120,
		0.6
	)
	

func update_order_text():
	var spoken_order = get_spoken_order()

func generate_customer_and_order():
	generate_customer()
	update_customer_sprite()
	animate_custumer_in()
	generate_real_order()
	update_order_text()
	

func cone_to_string(cone):
	match cone:
		IngredientsList.CONES.NORMAL:
			return "Normal Cone"
		IngredientsList.CONES.CHOCOLATE:
			return "Chocolate Cone"
		IngredientsList.CONES.STRAWBERRY:
			return "Strawberry Cone"
		IngredientsList.CONES.MILK:
			return "Milk Cone"
	#return "Unknown Cone"
	

func flavor_to_string(flavor):
	match flavor:
		IngredientsList.FLAVORS.DOCEDELEITE:
			return "Doce de Leite"
		IngredientsList.FLAVORS.STRAWBERRY:
			return "Strawberry"
		IngredientsList.FLAVORS.LIME:
			return "Lime"
		IngredientsList.FLAVORS.WINE:
			return "Wine"
		IngredientsList.FLAVORS.BUBBLEGUM:	
			return "Bubblegum"
		IngredientsList.FLAVORS.ORANGE:
			return "Orange"
	#return "Unknown Flavor"
