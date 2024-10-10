# examples

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_citrix_pa"></a> [citrix\_pa](#module\_citrix\_pa) | gitlab.abraxas-tools.ch/sit/terraform-citrixdaas-pa-mvd/local | #.#.# |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | Applikations Variablen | <pre>list(object({<br>    citrix_apllication_name                    = string<br>    citrix_apllication_description             = string<br>    citrix_apllication_published_name          = string<br>    citrix_application_command_line_arguments  = string<br>    citrix_application_command_line_executable = string<br>    citrix_application_working_directory       = string<br>    citrix_deliverygroup_name                  = list(string)<br>    citrix_apllication_visibility              = list(string)<br>    # citrix_application_icon                  = string<br>  }))</pre> | n/a | yes |
| <a name="input_mandant_prefix_m"></a> [mandant\_prefix\_m](#input\_mandant\_prefix\_m) | mandant prefix | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
