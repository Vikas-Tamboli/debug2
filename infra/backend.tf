terraform{
	backend "s3"{
    
		bucket  = "mybucket880"
		key     = "vik/terraform.tfstate"
		region  = "ap-south-1"
		access_key = var.a_key
                secret_key = var.s_key
}
}
