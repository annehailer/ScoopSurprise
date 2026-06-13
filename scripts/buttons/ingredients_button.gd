extends Button

@onready var main_scene: Main = get_parent().get_parent().get_parent()
@export var button_type: BUTTON_TYPE
@export var flavor: IngredientsList.FLAVORS 
@export var cone: IngredientsList.CONES 
@export var topping: IngredientsList.TOPPINGS
@onready var texture_rect: TextureRect = %TextureRect

var flavor_texture_scale: Vector2 = Vector2(0.9, 0.75)
var cone_texture_scale: Vector2 = Vector2(1, 1)
var topping_texture_scale: Vector2 = Vector2(0.63, 0.50)


func _ready() -> void:
	match button_type:
		BUTTON_TYPE.FLAVOR:
			var counterFlavor_texture: Texture = IngredientsList.get_counterFlavor_texture(flavor)
			texture_rect.scale = flavor_texture_scale
			texture_rect.texture = counterFlavor_texture
		BUTTON_TYPE.CONE:
			var counterCONE_texture: Texture = IngredientsList.get_counterCone_texture(cone)
			texture_rect.scale = cone_texture_scale
			texture_rect.texture = counterCONE_texture
		BUTTON_TYPE.TOPPING:
			var counterTopping_texture: Texture = IngredientsList.get_counterTopping_texture(topping)
			texture_rect.scale = topping_texture_scale
			texture_rect.texture = counterTopping_texture
		BUTTON_TYPE.NULL:
			return


func _on_button_down() -> void:
	#print("click", name)
	#print("TIPO:", button_type)
	#print(main_scene)
	match button_type:
		BUTTON_TYPE.FLAVOR:
			var flavor_texture: Texture = IngredientsList.get_flavor_texture(flavor)
			main_scene.add_icecream_ball(flavor_texture, flavor)
		BUTTON_TYPE.CONE:
			var cone_texture: Texture = IngredientsList.get_cone_texture(cone)
			main_scene.change_cone(cone_texture, cone)
		BUTTON_TYPE.TOPPING:
			var topping_texture: Texture = IngredientsList.get_topping_texture(topping)
			main_scene.add_topping(topping_texture, topping)
		BUTTON_TYPE.NULL:
			return



enum BUTTON_TYPE {
	FLAVOR,
	CONE,
	TOPPING,
	NULL
}
