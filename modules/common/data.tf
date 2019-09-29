data "dominos_address" "home" {
  street = "${var.street_address}"
  city = "${var.city}"
  state = "${var.state}"
  zip = "${var.zip}"
}

data "dominos_store" "store" {
  address_url_object = "${data.dominos_address.home.url_object}"
}