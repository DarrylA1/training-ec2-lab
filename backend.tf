terraform {
  backend "s3" {
    bucket = "darryl-talent-academy-686520628199-tfstates"
    key    = "projects/ec2/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}