# citrix_daas_application.example-application nur ein test:
resource "citrix_application" "application-cmd" {
  name            = var.application-cmd_admin_name
  published_name  = var.application-cmd_published_name
  delivery_groups = [citrix_delivery_group.dg.id]
  description     = "Performs text-based (command-line) functions."
  # application_folder_path = citrix_application_folder.m002-application-folder.path
  installed_app_properties = {
    command_line_executable = var.application-cmd_command_line_executable
    working_directory       = var.application-cmd_working_directory
  }
}
