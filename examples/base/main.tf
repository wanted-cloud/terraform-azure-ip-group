module "template" {
    source = "../.."
    
    name = "example1-ipgroup"
    resource_group_name = "example-rg"
    address_spaces = [ "10.0.0.0/24" ]
}