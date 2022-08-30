module "eks" {
  source            = "./modules/eks"
  aws_public_subnet = module.vpc.aws_public_subnet
  vpc_id            = module.vpc.vpc_id
  cluster_name      = "education-eks-${random_string.suffix.result}"
}

module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  access_ip       = "0.0.0.0/0"
  public_sn_count = 2
  public_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
}








