module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "dishant-infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ami_id = "ami-04f167a56786e4b09"
}

module "prd-infra" {
  source = "./infra-app"
  env = "prd"
  bucket_name = "dishant-infra-app-bucket"
  instance_count = 2
  instance_type = "t2.micro"
  ami_id = "ami-04f167a56786e4b09"
}

module "stg-infra" {
  source = "./infra-app"
  env = "stg"
  bucket_name = "ishant-infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ami_id = "ami-04f167a56786e4b09"
}