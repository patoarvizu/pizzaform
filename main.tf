module "common" {
  source = "modules/common"
  street_address = "${var.street_address}"
  city = "${var.city}"
  state = "${var.state}"
  zip = "${var.zip}"
}

data "dominos_menu_item" "medium_hand_tossed_buffalo_chicken" {
  store_id = "${module.common.store_id}"
  query_string = ["Medium", "Hand Tossed Buffalo Chicken"]
}

data "dominos_menu_item" "garlic_dipping_sauce" {
  store_id = "${module.common.store_id}"
  query_string = ["Garlic Dipping Cup"]
}

resource "dominos_order" "order" {
  address_api_object = "${module.common.address_api_oject}"
  item_codes = [
    "${data.dominos_menu_item.medium_hand_tossed_buffalo_chicken.matches.0.code}",
    "${data.dominos_menu_item.garlic_dipping_sauce.matches.0.code}",
    "${data.dominos_menu_item.garlic_dipping_sauce.matches.0.code}",
  ]
  store_id = "${module.common.store_id}"
}
