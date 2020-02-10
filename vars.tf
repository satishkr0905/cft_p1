variable "AWS_REGION" {    
    default = "ap-south-1"
}
variable "AMI" {
  type = "map"
  default {
      ap-south-1 = "ami-0217a85e28e625474"
      us-east-1 = "ami-062f7200baf2fa504"
  }
}
