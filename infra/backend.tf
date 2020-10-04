provider "aws" {
	profile = "jenkins"
	region = "ap-south-1"
}

terraform{
	backend "s3"{
    
		bucket = "mybucket880"
		key = "infra/terraform.tfstate"
		region = "ap-south-1"

}
}
