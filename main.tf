module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "dishant-infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ami_id = "ami-04f167a56786e4b09"
}