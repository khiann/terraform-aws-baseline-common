data "terraform_remote_state" "avm" {
#modified by KA
#  backend = "remote"
#
#  config = {
#    organization = var.tfe_org_name
#    hostname     = var.tfe_host_name
#    workspaces = {
#      name = var.tfe_avm_workspace_name
#    }
#  }
  backend "s3" {
    bucket = "tlz-demo-dev-terraform-state-575284287550"
    dynamodb_table = "tlz-demo-dev-terraform-state-575284287550-lock"
    key    = "AVMIAM.tfstate"
    region = "ap-southeast-1"
    encrypt = true

  }
}

# Roles and policies
module "iam-policy" {
  source = "./modules/iam-policy-common"

  # master_payer_account         = "${var.master_payer_account}"
  # core_security_account        = "${var.core_security_account}"
  # core_shared_services_account = "${var.core_shared_services_account}"
  master_payer_account         = data.terraform_remote_state.avm.outputs.master_payer_account
  core_security_account        = data.terraform_remote_state.avm.outputs.core_security_account
  core_shared_services_account = data.terraform_remote_state.avm.outputs.core_shared_services_account

  tlz_admin_role    = var.role_name
  okta_provider_arn = aws_iam_saml_provider.okta.arn
  region            = var.region
  region_secondary  = var.region_secondary
  # tags_label_context = var.tags_label_context
}

