terraform{
	backend "s3"{
    
		bucket  = "mybucket880"
		key     = "infra/terraform.tfstate"
		region  = "ap-south-1"
		access_key = var.a_key
	        secter_key = var.s_key
}
}
