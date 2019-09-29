provider "dominos" {
  email_address = "${var.email_address}"
  first_name = "${var.first_name}"
  last_name = "${var.last_name}"
  phone_number = "${var.phone_number}"
  credit_card {
    number = "${var.credit_card_number}"
    cvv = "${var.cvv}"
    date = "${var.expiration_date}"
    zip = "${var.zip}"
  }
}