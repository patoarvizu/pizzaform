# pizzaform

Ordering pizza with Terraform

## What is this?

I decided to give the [Domino's provider for Terraform](https://ndmckinley.github.io/terraform-provider-dominos/) a try. I made the code public to document my experience in case someone else wanted to give it a shot as well.

### Steps

It was actually quite simple.

- Clone https://github.com/ndmckinley/terraform-provider-dominos into your `$GOPATH`, run `go get && go build -o terraform-provider-dominos ./` to build the binary, then copy `terraform-provider-dominos` to `~/.terraform.d/plugins`.
  - Alternatively, you can just copy the binary at `https://github.com/ndmckinley/terraform-provider-dominos/raw/master/bin/terraform-provider-dominos` (at your own risk).
- Run `terraform init`.
  - I'm not using a remote state because a) sensitive information will be in plain text there, and b) since the provider can't implement a `terraform destroy`, managing local state files that I can delete once I finish my pizza is easier.
- Create a `home.tfvars` file with your info. Don't put any credit card or personal information in any public repository, that's why `*.tfvars` is in `.gitignore`.
- Run `terraform apply -var-file=home.tfvars`.
- Accept.
- Wait.
- Enjoy pizza.

## Tip your delivery person!

The provider doesn't let you add a tip if you're paying with a credit card. While we're having fun coding Terraform, they are working and making a living, so make sure you tip if you had good service.

## Gotchas

I ran into two gotchas while doing this.

- I noticed that sometimes the HTTP requests made by the provider to the Domino's API were timing out and it kinda correlated to when I was running `terraform plan` frequently, so maybe there's some form of throttling on their side.
- When I finally ran `terraform apply` to actually order the pizza, Terraform crashed with one of those ugly `!!! TERRAFORM CRASH !!!` errors. The order did go through so it wasn't a big issue. It looks like the error was on an unexpected EOF getting the order status or something, but I wasn't going to try creating new orders to debug it.

## DISCLAIMER

The provider mentions it but it's worth mentioning here too. This is a real provider that will make real API calls, charge real dollars to your credit card, and order real pizza. Don't `terraform apply` unless you really want to order pizza. And you should order pizza, just make sure you're aware you're actually ordering pizza. If you don't enter credit card information, the order will still go through but you'll have to pay cash when the pizza is delivered!

Also, I'm not affiliated with Domino's, the Domino's Terraform provider, Terraform, or HashiCorp. I'm just a guy that likes pizza and Terraform.