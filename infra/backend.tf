terraform{
	backend "s3"{
    
		bucket  = "mybucket880"
		key     = "vik/terraform.tfstate"
		region  = "ap-south-1"
		profile = "jenkins"
}
}
