# citrix_daas_application.example-application nur ein test:
resource "citrix_application" "application_cmd" {
  name                      = var.application_cmd_admin_name
  published_name            = var.application_cmd_published_name
  delivery_groups           = var.deliverygroup_name
  icon                      = citrix_application_icon.my_citrix_application_icon.id
  description               = var.description_pubblished_apps
  limit_visibility_to_users = var.visibility_user

  # application_folder_path = citrix_application_folder.m002-application-folder.path
  installed_app_properties = {
    command_line_executable = var.application_cmd_command_line_executable
    working_directory       = var.application_cmd_working_directory
  }
}

resource "citrix_application_icon" "my_citrix_application_icon" {
  raw_data = var.application_icon
}




# You can use the following PowerShell commands to convert an .ico file to base64:
# $pic = Get-Content 'fileName.ico' -Encoding Byte
# $picBase64 = [System.Convert]::ToBase64String($pic)
