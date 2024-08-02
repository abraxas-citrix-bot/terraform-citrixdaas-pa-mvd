variable "application_cmd_admin_name" {
  description = "The name of the application"
  type        = string

}

variable "application_cmd_published_name" {
  description = "The name of the application"
  type        = string

}

variable "application_cmd_command_line_executable" {
  description = "The command line executable"
  type        = string

}

variable "application_cmd_working_directory" {
  description = "The working directory"
  type        = string

}

variable "deliverygroup_name" {
  description = "Delivery group"
  type        = set(string)

}

variable "description_pubblished_apps" {
  description = "For the description"
  type        = string

}
variable "visibility_user" {
  description = "The visibility of the application"
  type        = set(string)

}


variable "application_icon" {
  type        = string
  description = "The icon of the application"


}