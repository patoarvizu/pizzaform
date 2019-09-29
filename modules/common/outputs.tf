output "store_id" {
  value = "${data.dominos_store.store.store_id}"
}

output "address_api_oject" {
  value = "${data.dominos_address.home.api_object}"
}
