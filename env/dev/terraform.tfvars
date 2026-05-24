prefix   = "db-dev"
location = "eastus"

workspaces = {
  "analytics" = {
    vnet_cidr           = "10.1.0.0/16"
    public_subnet_cidr  = "10.1.1.0/24"
    private_subnet_cidr = "10.1.2.0/24"
    sku                 = "premium"
  },
  "ml-ops" = {
    vnet_cidr           = "10.2.0.0/16"
    public_subnet_cidr  = "10.2.1.0/24"
    private_subnet_cidr = "10.2.2.0/24"
    sku                 = "premium"
  }
}

tags = {
  Environment = "Development"
  Owner       = "DataEngineers"
  ManagedBy   = "Terraform"
  Project     = "DataPlatform"
}
