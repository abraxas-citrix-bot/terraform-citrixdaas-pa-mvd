variable "application_cmd_admin_name" {
  description = "The name of the application"
  type        = string
  default     = "CMD"
}

variable "application_cmd_published_name" {
  description = "The name of the application"
  type        = string
  default     = "Windows Command Prompt"
}

variable "application_cmd_command_line_executable" {
  description = "The command line executable"
  type        = string
  default     = "C:\\Windows\\system32\\cmd.exe"
}

variable "application_cmd_working_directory" {
  description = "The working directory"
  type        = string
  default     = "%HOMEDRIVE%%HOMEPATH%"
}

variable "deliverygroup_name" {
  description = "Delivery group"
  type        = set(string)
}

variable "description_pubblished_apps" {
  description = "For the description"
  type        = string
}
