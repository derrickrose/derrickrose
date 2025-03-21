provider "aws" {
  region  = "eu-west-1"
  profile = "dev-izybe"
}

//this is a string variable

variable "firststring" {
  type    = string
  default = "this is my first string"
}

variable "multilinestring" {
  type    = string
  default = <<EOH
	this is a multiline
	string
	newline
	EOH
}

output "myfirstoutput" {
  value = var.firststring
}

output "mymultilineoutput" {
  value = var.multilinestring
}


//This is my maps example

variable "mapexample" {
  type    = map
  default = {
    "useast" = "ami1"
    "euwest" = "ami2"
  }
}

output "mapoutput" {
  value = var.mapexample["euwest"]
}

//this is array/lists

variable "mysecuritygrouplist" {
  type    = list
  default = ["sg1", "sg2", "sg3"]
}

output "sgoutput" {
  value = var.mysecuritygrouplist
}

variable "testbool" {
  default = false
}

output "booloutput" {
  value = var.testbool
}

variable "myInputVariable" {
  type = string
}

output "myOutputVariable" {
  sensitive = true
  value     = var.myInputVariable
}

output "test_keypair" {
  value = file("id_rsa.pub")
}