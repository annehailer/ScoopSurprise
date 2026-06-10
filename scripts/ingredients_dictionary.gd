extends Node

# flavors ----------------------------------------------------------------

enum FLAVORS {
	BUBBLEGUM,
	DOCEDELEITE,
	LIME,
	ORANGE,
	STRAWBERRY,
	WINE,
	NULL
}

const FLAVOR_BUBBLEGUM := {"texture": preload("uid://b38hwnampquue"), "counter_texture": preload("uid://1ahytenh5cv3")}
const FLAVOR_DOCEDELEITE := {"texture": preload("uid://bj5nwny1x575s"), "counter_texture": preload("uid://cct8ntrj5ma0u")}
const FLAVOR_LIME := {"texture": preload("uid://bh3w3e3vq7nfw"), "counter_texture": preload("uid://efmvyy0rpcm")}
const FLAVOR_ORANGE := {"texture": preload("uid://54wb3jvdrmts"), "counter_texture": preload("uid://ck1oq4blyq4k5")}
const FLAVOR_STRAWBERRY := {"texture": preload("uid://b7loyrfr4hwq0"), "counter_texture": preload("uid://bv3lxyjro1av")}
const FLAVOR_WINE := {"texture": preload("uid://daplm3d25n10a"), "counter_texture": preload("uid://bkmghmxwritme")}

func get_flavor_texture(flavor: FLAVORS):
	match flavor:
		FLAVORS.BUBBLEGUM:
			return FLAVOR_BUBBLEGUM.texture
		FLAVORS.DOCEDELEITE:
			return FLAVOR_DOCEDELEITE.texture
		FLAVORS.LIME:
			return FLAVOR_LIME.texture
		FLAVORS.ORANGE:
			return FLAVOR_ORANGE.texture
		FLAVORS.STRAWBERRY:
			return FLAVOR_STRAWBERRY.texture
		FLAVORS.WINE:
			return FLAVOR_WINE.texture

func get_counterFlavor_texture(flavor: FLAVORS):
	match flavor:
		FLAVORS.BUBBLEGUM:
			return FLAVOR_BUBBLEGUM.counter_texture
		FLAVORS.DOCEDELEITE:
			return FLAVOR_DOCEDELEITE.counter_texture
		FLAVORS.LIME:
			return FLAVOR_LIME.counter_texture
		FLAVORS.ORANGE:
			return FLAVOR_ORANGE.counter_texture
		FLAVORS.STRAWBERRY:
			return FLAVOR_STRAWBERRY.counter_texture
		FLAVORS.WINE:
			return FLAVOR_WINE.counter_texture

# cones ----------------------------------------------------------------

enum CONES {
	CHOCOLATE,
	MILK,
	NORMAL,
	STRAWBERRY,
	NULL
}

const CONE_CHOCOLATE := {"texture": preload("uid://c2buiyj254te"), "counter_texture": preload("uid://cf03ahwk7stqa")}
const CONE_MILK := {"texture": preload("uid://l5xrtxocx0rd"), "counter_texture": preload("uid://btmidaikxm3uy")}
const CONE_NORMAL := {"texture": preload("uid://bcn7d02kced4a"), "counter_texture": preload("uid://dnpk1xxfb38su")}
const CONE_STRAWBERRY := {"texture": preload("uid://c8okto1qrli6g"), "counter_texture": preload("uid://cd3kceme456bb")}

func get_cone_texture(cone: CONES):
	match cone:
		CONES.CHOCOLATE:
			return CONE_CHOCOLATE.texture
		CONES.MILK:
			return CONE_MILK.texture
		CONES.NORMAL:
			return CONE_NORMAL.texture
		CONES.STRAWBERRY:
			return CONE_STRAWBERRY.texture

func get_counterCone_texture(cone: CONES):
	match cone:
		CONES.CHOCOLATE:
			return CONE_CHOCOLATE.texture
		CONES.MILK:
			return CONE_MILK.texture
		CONES.NORMAL:
			return CONE_NORMAL.texture
		CONES.STRAWBERRY:
			return CONE_STRAWBERRY.texture
