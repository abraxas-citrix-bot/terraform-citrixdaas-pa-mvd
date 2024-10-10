module "terraform_citrixdaas_pa_mvd" {
  source                                     = "gitlab.abraxas-tools.ch/sit/terraform-citrixdaas-pa-mvd/local"
  version                                    = "0.3.8"
  for_each                                   = { for app in var.applications : "${var.mandant_prefix}-${app.citrix_application_name}" => app }
  citrix_application_name                    = each.key
  citrix_application_description             = each.value.citrix_application_description
  citrix_application_published_name          = each.value.citrix_application_published_name
  citrix_application_command_line_arguments  = each.value.citrix_application_command_line_arguments
  citrix_application_command_line_executable = each.value.citrix_application_command_line_executable
  citrix_application_working_directory       = each.value.citrix_application_working_directory
  citrix_application_visibility              = each.value.citrix_application_visibility
  citrix_application_icon                    = filebase64("${path.root}/icons/${each.value.citrix_application_icon}")
  citrix_application_folder_path             = module.terraform_citrixdaas_af_mvd.citrix_admin_folder_path
  citrix_deliverygroup_name                  = [module.terraform_citrixdaas_dg_mvd.citrix_delivery_group_id]
  depends_on                                 = [module.terraform_citrixdaas_af_mvd]
}
