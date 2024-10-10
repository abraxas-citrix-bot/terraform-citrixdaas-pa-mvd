# Default input
mandant_prefix_m = "m152"

# Modul citrix_pa / for each Schlaufe
applications = [
  {
    citrix_apllication_name                    = "Name der App sichtbar für Administrator" # wird in der Schlaufe mit Mandantenprefix erstellt
    citrix_apllication_description             = "Application Description"
    citrix_apllication_published_name          = "Name der App sichtbar für user"
    citrix_application_command_line_arguments  = "“%**”" # aktuell noch ein Bug, es kann kein leerer Wert angegeben werden
    citrix_application_command_line_executable = "Pfad zur exe"
    citrix_application_working_directory       = "Arbeitsverzeichnis"
    citrix_deliverygroup_name                  = ["6919cebe-4151-40a8-8efd-9047694377a6"] #wird später über ein modul gelöst
    citrix_apllication_visibility              = ["domain\\username"]                     # Benutzer oder Gruppe definieren
    # citrix_application_icon                    = ""
  },

  # weitere Applikationen müssen einzeln erfasst werden: z.b. - hier ein konkretes Beispiel

  {
    citrix_apllication_name                    = "Notepad"
    citrix_apllication_description             = "Test mit Terraform"
    citrix_apllication_published_name          = "Notepad"
    citrix_application_command_line_arguments  = "“%**”" # aktuell noch ein Bug, es kann kein leerer Wert angegeben werden
    citrix_application_command_line_executable = "C:\\Windows\\system32\\notepad.exe"
    citrix_application_working_directory       = "%HOMEDRIVE%%HOMEPATH%"
    citrix_deliverygroup_name                  = ["6919cebe-4151-40a8-8efd-9047694377a6"]
    citrix_apllication_visibility              = ["m002\\axdlet"]
    # citrix_application_icon                    = "C:\\Windows\\system32\\notepad.exe"
  }
]
