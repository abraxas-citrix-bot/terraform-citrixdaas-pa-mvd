variable "citrix_apllication_name" {
  description = "The name of the application"
  type        = string

}

variable "citrix_apllication_description" {
  description = "Application Description"
}

variable "citrix_apllication_published_name" {
  description = "The name of the application"
  type        = string

}

variable "citrix_application_command_line_arguments" {
  description = "cmd arguments"
  type = string
}


variable "citrix_application_command_line_executable" {
  description = "The command line executable"
  type        = string

}

variable "citrix_application_working_directory" {
  description = "The working directory"
  type        = string

}

variable "citrix_deliverygroup_name" {
  description = "Delivery group"
  type        = set(string)

}

variable "citrix_apllication_visibility" {
  description = "The visibility of the application"
  type        = set(string)

}

variable "citrix_application_icon" {
  type        = string
  description = "The icon of the application"


}

variable "citrix_application_folder" {
  description = "Application Folder"
  type = string
}