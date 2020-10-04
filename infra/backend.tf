terraform{
backend "s3"{
    
bucket = "mybucket880"
key = "terraform.tfstate"
region = "ap-south-1"

}
}
