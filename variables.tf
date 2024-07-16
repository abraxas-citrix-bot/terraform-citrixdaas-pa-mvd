variable "application-cmd_admin_name" {
  description = "The name of the application"
  type        = string
  default     = "CMD"
}

variable "application-cmd_published_name" {
  description = "The name of the application"
  type        = string
  default     = "Windows Command Prompt"
}

variable "application-cmd_command_line_executable" {
  description = "The command line executable"
  type        = string
  default     = "C:\\Windows\\system32\\cmd.exe"
}

variable "application-cmd_working_directory" {
  description = "The working directory"
  type        = string
  default     = "%HOMEDRIVE%%HOMEPATH%"
}

variable "alessio" {

  default = "Linux ist mein Freund"
  description = "Value"
  
}