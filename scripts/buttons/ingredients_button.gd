extends TextureButton

@onready var main_scene: Main = get_parent().get_parent().get_parent()
@export var button_type: BUTTON_TYPE
@export var flavor: IngredientsList.FLAVORS 
@export var cone: IngredientsList.CONES 
@export var topping: IngredientsList.TOPPINGS


func _ready() -> void:
	match button_type:
		BUTTON_TYPE.FLAVOR:
			var counterFlavor_texture: Texture = IngredientsList.get_counterFlavor_texture(flavor)
			texture_normal = counterFlavor_texture
		BUTTON_TYPE.CONE:
			#self.set_size(Vector2(10, 10))
			var counterCONE_texture: Texture = IngredientsList.get_counterCone_texture(cone)
			texture_normal = counterCONE_texture
		BUTTON_TYPE.TOPPING:
			var counterTopping_texture: Texture = IngredientsList.get_counterTopping_texture(topping)
			texture_normal = counterTopping_texture


func _on_button_down() -> void:
	print("click", name)
	print("TIPO:", button_type)
	print(main_scene)
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



enum BUTTON_TYPE {
	FLAVOR,
	CONE,
	TOPPING
}
