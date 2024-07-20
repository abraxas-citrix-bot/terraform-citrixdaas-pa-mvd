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
  default     = ["6919cebe-4151-40a8-8efd-9047694377a6"]

}

variable "description_pubblished_apps" {
  description = "For the description"
  type        = string
  default     = "value"
}


########################################################################
### die Vars muss im voraus als Environment Variables gesetzt werden ###
### export ARM_CLIENT_ID=""                                   werden ###
########################################################################

variable "customer_id" {
  type        = string
  description = "The Citrix Cloud customer id"
}

variable "client_id" {
  type        = string
  description = "The Citrix Cloud client id"

}

variable "client_secret" {
  type        = string
  description = "The Citrix Cloud client secret"

}
