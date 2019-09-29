data "dominos_address" "home" {
  street = "${var.street_address}"
  city = "${var.city}"
  state = "${var.state}"
  zip = "${var.zip}"
}

data "dominos_store" "store" {
  address_url_object = "${data.dominos_address.home.url_object}"
}

data "dominos_menu" "menu" {
  store_id = "${data.dominos_store.store.store_id}"
}