# citrix_daas_application.example-application nur ein test:
resource "citrix_application" "application_cmd" {
  name            = var.application_cmd_admin_name
  published_name  = var.application_cmd_published_name
  delivery_groups = var.deliverygroup_name
  #[citrix_delivery_group.dg.id]
  description = var.description_pubblished_apps
  # application_folder_path = citrix_application_folder.m002-application-folder.path
  installed_app_properties = {
    command_line_executable = var.application_cmd_command_line_executable
    working_directory       = var.application_cmd_working_directory
  }
}
