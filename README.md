# terraform-docs

[![Build Status](https://github.com/terraform-docs/terraform-docs/workflows/ci/badge.svg)](https://github.com/terraform-docs/terraform-docs/actions) [![GoDoc](https://pkg.go.dev/badge/github.com/terraform-docs/terraform-docs)](https://pkg.go.dev/github.com/terraform-docs/terraform-docs) [![Go Report Card](https://goreportcard.com/badge/github.com/terraform-docs/terraform-docs)](https://goreportcard.com/report/github.com/terraform-docs/terraform-docs) [![Codecov Report](https://codecov.io/gh/terraform-docs/terraform-docs/branch/master/graph/badge.svg)](https://codecov.io/gh/terraform-docs/terraform-docs) [![License](https://img.shields.io/github/license/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/blob/master/LICENSE) [![Latest release](https://img.shields.io/github/v/release/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/releases)

![terraform-docs-teaser](./images/terraform-docs-teaser.png)

## What is terraform-docs

A utility to generate documentation from Terraform modules in various output formats.

## Installation

macOS users can install using [Homebrew]:

```bash
brew install terraform-docs
```

or

```bash
brew install terraform-docs/tap/terraform-docs
```

Windows users can install using [Scoop]:

```bash
scoop bucket add terraform-docs https://github.com/terraform-docs/scoop-bucket
scoop install terraform-docs
```

or [Chocolatey]:

```bash
choco install terraform-docs
```

Stable binaries are also available on the [releases] page. To install, download the
binary for your platform from "Assets" and place this into your `$PATH`:

```bash
curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.18.0/terraform-docs-v0.18.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs /usr/local/bin/terraform-docs
```

**NOTE:** Windows releases are in `ZIP` format.

The latest version can be installed using `go install` or `go get`:

```bash
# go1.17+
go install github.com/terraform-docs/terraform-docs@v0.18.0
```

```bash
# go1.16
GO111MODULE="on" go get github.com/terraform-docs/terraform-docs@v0.18.0
```

**NOTE:** please use the latest Go to do this, minimum `go1.16` is required.

This will put `terraform-docs` in `$(go env GOPATH)/bin`. If you encounter the error
`terraform-docs: command not found` after installation then you may need to either add
that directory to your `$PATH` as shown [here] or do a manual installation by cloning
the repo and run `make build` from the repository which will put `terraform-docs` in:

```bash
$(go env GOPATH)/src/github.com/terraform-docs/terraform-docs/bin/$(uname | tr '[:upper:]' '[:lower:]')-amd64/terraform-docs
```

## Usage

**Hauptmodul: customer.auto.tfvars** <br>
Kundenspezifische Daten: Mandantekürzel (z.b. m001)
```hcl
# Default input
mandant_prefix_m = "m###"

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

```
**Hauptmodul: variables.tf** <br>
definition der variablen
```hcl
variable "mandant_prefix_m" {
  description = "mandant prefix"
  type        = string
}

variable "applications" {
  description = "Applikations Variablen"
  type = list(object({
    citrix_apllication_name                    = string
    citrix_apllication_description             = string
    citrix_apllication_published_name          = string
    citrix_application_command_line_arguments  = string
    citrix_application_command_line_executable = string
    citrix_application_working_directory       = string
    citrix_deliverygroup_name                  = list(string)
    citrix_apllication_visibility              = list(string)
    # citrix_application_icon                  = string
  }))
}

```
**Hauptmodul: main.tf** <br>
Aufruf des Moduls vom Hauptmodul
```hcl
module "citrix_pa" {
  source  = "gitlab.abraxas-tools.ch/sit/terraform-citrixdaas-pa-mvd/local"
  version = "#.#.#"

  for_each = { for app in var.applications : "${var.mandant_prefix_m}-${app.citrix_apllication_name}" => app }

  citrix_apllication_name                    = each.key
  citrix_apllication_description             = each.value.citrix_apllication_description
  citrix_apllication_published_name          = each.value.citrix_apllication_published_name
  citrix_application_command_line_arguments  = each.value.citrix_application_command_line_arguments
  citrix_application_command_line_executable = each.value.citrix_application_command_line_executable
  citrix_application_working_directory       = each.value.citrix_application_working_directory
  citrix_deliverygroup_name                  = each.value.citrix_deliverygroup_name
  citrix_apllication_visibility              = each.value.citrix_apllication_visibility
  #  citrix_application_icon                    = each.value.citrix_application_icon


  # nicht im Loop (Folder für alle Apps identisch, da Kundenbasiert) Seperates Modul "terraform-citrixdaas-af-mvd" verwenden falls benötigt, sonst auskommentieren (Folder path ist optional)
  citrix_application_folder_path = module.citrix_af.citrix_application_folder_path
  depends_on                     = [module.citrix_af]
}
```

### Running the binary directly

To run and generate documentation into README within a directory:

```bash
terraform-docs markdown table --output-file README.md --output-mode inject /path/to/module
```

Check [`output`] configuration for more details and examples.

### Using docker

terraform-docs can be run as a container by mounting a directory with `.tf`
files in it and run the following command:

```bash
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 markdown /terraform-docs
```

If `output.file` is not enabled for this module, generated output can be redirected
back to a file:

```bash
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 markdown /terraform-docs > doc.md
```

**NOTE:** Docker tag `latest` refers to _latest_ stable released version and `edge`
refers to HEAD of `master` at any given point in time.

### Using GitHub Actions

To use terraform-docs GitHub Action, configure a YAML workflow file (e.g.
`.github/workflows/documentation.yml`) with the following:

```yaml
name: Generate terraform docs
on:
  - pull_request

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ github.event.pull_request.head.ref }}

      - name: Render terraform docs and push changes back to PR
        uses: terraform-docs/gh-actions@main
        with:
          working-dir: .
          output-file: README.md
          output-method: inject
          git-push: "true"
```

Read more about [terraform-docs GitHub Action] and its configuration and
examples.

### pre-commit hook

With pre-commit, you can ensure your Terraform module documentation is kept
up-to-date each time you make a commit.

First [install pre-commit] and then create or update a `.pre-commit-config.yaml`
in the root of your Git repo with at least the following content:

```yaml
repos:
  - repo: https://github.com/terraform-docs/terraform-docs
    rev: "v0.18.0"
    hooks:
      - id: terraform-docs-go
        args:
          ["markdown", "table", "--output-file", "README.md", "./mymodule/path"]
```

Then run:

```bash
pre-commit install
pre-commit install-hooks
```

Further changes to your module's `.tf` files will cause an update to documentation
when you make a commit.

## Configuration

terraform-docs can be configured with a yaml file. The default name of this file is
`.terraform-docs.yml` and the path order for locating it is:

1. root of module directory
1. `.config/` folder at root of module directory
1. current directory
1. `.config/` folder at current directory
1. `$HOME/.tfdocs.d/`

```yaml
formatter: "" # this is required

version: ""

header-from: main.tf
footer-from: ""

recursive:
  enabled: false
  path: modules
  include-main: true

sections:
  hide: []
  show: []

content: ""

output:
  file: ""
  mode: inject
  template: |-
    <!-- BEGIN_TF_DOCS -->
    {{ .Content }}
    <!-- END_TF_DOCS -->

output-values:
  enabled: false
  from: ""

sort:
  enabled: true
  by: name

settings:
  anchor: true
  color: true
  default: true
  description: false
  escape: true
  hide-empty: false
  html: true
  indent: 2
  lockfile: true
  read-comments: true
  required: true
  sensitive: true
  type: true
```

## Content Template

Generated content can be customized further away with `content` in configuration.
If the `content` is empty the default order of sections is used.

Compatible formatters for customized content are `asciidoc` and `markdown`. `content`
will be ignored for other formatters.

`content` is a Go template with following additional variables:

- `{{ .Header }}`
- `{{ .Footer }}`
- `{{ .Inputs }}`
- `{{ .Modules }}`
- `{{ .Outputs }}`
- `{{ .Providers }}`
- `{{ .Requirements }}`
- `{{ .Resources }}`

and following functions:

- `{{ include "relative/path/to/file" }}`

These variables are the generated output of individual sections in the selected
formatter. For example `{{ .Inputs }}` is Markdown Table representation of _inputs_
when formatter is set to `markdown table`.

Note that sections visibility (i.e. `sections.show` and `sections.hide`) takes
precedence over the `content`.

Additionally there's also one extra special variable avaialble to the `content`:

- `{{ .Module }}`

As opposed to the other variables mentioned above, which are generated sections
based on a selected formatter, the `{{ .Module }}` variable is just a `struct`
representing a [Terraform module].

````yaml
content: |-
  Any arbitrary text can be placed anywhere in the content

  {{ .Header }}

  and even in between sections

  {{ .Providers }}

  and they don't even need to be in the default order

  {{ .Outputs }}

  include any relative files

  {{ include "relative/path/to/file" }}

  {{ .Inputs }}

  # Examples

  ```hcl
  {{ include "examples/foo/main.tf" }}
  ```

  ## Resources

  {{ range .Module.Resources }}
  - {{ .GetMode }}.{{ .Spec }} ({{ .Position.Filename }}#{{ .Position.Line }})
  {{- end }}
````

## Build on top of terraform-docs

terraform-docs primary use-case is to be utilized as a standalone binary, but
some parts of it is also available publicly and can be imported in your project
as a library.

```go
import (
    "github.com/terraform-docs/terraform-docs/format"
    "github.com/terraform-docs/terraform-docs/print"
    "github.com/terraform-docs/terraform-docs/terraform"
)

// buildTerraformDocs for module root `path` and provided content `tmpl`.
func buildTerraformDocs(path string, tmpl string) (string, error) {
    config := print.DefaultConfig()
    config.ModuleRoot = path // module root path (can be relative or absolute)

    module, err := terraform.LoadWithOptions(config)
    if err != nil {
        return "", err
    }

    // Generate in Markdown Table format
    formatter := format.NewMarkdownTable(config)

    if err := formatter.Generate(module); err != nil {
        return "", err
    }

    // // Note: if you don't intend to provide additional template for the generated
    // // content, or the target format doesn't provide templating (e.g. json, yaml,
    // // xml, or toml) you can use `Content()` function instead of `Render()`.
    // // `Content()` returns all the sections combined with predefined order.
    // return formatter.Content(), nil

    return formatter.Render(tmpl)
}
```

## Plugin

Generated output can be heavily customized with [`content`], but if using that
is not enough for your use-case, you can write your own plugin.

In order to install a plugin the following steps are needed:

- download the plugin and place it in `~/.tfdocs.d/plugins` (or `./.tfdocs.d/plugins`)
- make sure the plugin file name is `tfdocs-format-<NAME>`
- modify [`formatter`] of `.terraform-docs.yml` file to be `<NAME>`

**Important notes:**

- if the plugin file name is different than the example above, terraform-docs won't
  be able to to pick it up nor register it properly
- you can only use plugin thorough `.terraform-docs.yml` file and it cannot be used
  with CLI arguments

To create a new plugin create a new repository called `tfdocs-format-<NAME>` with
following `main.go`:

```go
package main

import (
    _ "embed" //nolint

    "github.com/terraform-docs/terraform-docs/plugin"
    "github.com/terraform-docs/terraform-docs/print"
    "github.com/terraform-docs/terraform-docs/template"
    "github.com/terraform-docs/terraform-docs/terraform"
)

func main() {
    plugin.Serve(&plugin.ServeOpts{
        Name:    "<NAME>",
        Version: "0.1.0",
        Printer: printerFunc,
    })
}

//go:embed sections.tmpl
var tplCustom []byte

// printerFunc the function being executed by the plugin client.
func printerFunc(config *print.Config, module *terraform.Module) (string, error) {
    tpl := template.New(config,
        &template.Item{Name: "custom", Text: string(tplCustom)},
    )

    rendered, err := tpl.Render("custom", module)
    if err != nil {
        return "", err
    }

    return rendered, nil
}
```

Please refer to [tfdocs-format-template] for more details. You can create a new
repository from it by clicking on `Use this template` button.

## Documentation

- **Users**
  - Read the [User Guide] to learn how to use terraform-docs
  - Read the [Formats Guide] to learn about different output formats of terraform-docs
  - Refer to [Config File Reference] for all the available configuration options
- **Developers**
  - Read [Contributing Guide] before submitting a pull request

Visit [our website] for all documentation.

## Community

- Discuss terraform-docs on [Slack]

## License

MIT License - Copyright (c) 2021 The terraform-docs Authors.

[Chocolatey]: https://www.chocolatey.org
[Config File Reference]: https://terraform-docs.io/user-guide/configuration/
[`content`]: https://terraform-docs.io/user-guide/configuration/content/
[Contributing Guide]: CONTRIBUTING.md
[Formats Guide]: https://terraform-docs.io/reference/terraform-docs/
[`formatter`]: https://terraform-docs.io/user-guide/configuration/formatter/
[here]: https://golang.org/doc/code.html#GOPATH
[Homebrew]: https://brew.sh
[install pre-commit]: https://pre-commit.com/#install
[`output`]: https://terraform-docs.io/user-guide/configuration/output/
[releases]: https://github.com/terraform-docs/terraform-docs/releases
[Scoop]: https://scoop.sh/
[Slack]: https://slack.terraform-docs.io/
[terraform-docs GitHub Action]: https://github.com/terraform-docs/gh-actions
[Terraform module]: https://pkg.go.dev/github.com/terraform-docs/terraform-docs/terraform#Module
[tfdocs-format-template]: https://github.com/terraform-docs/tfdocs-format-template
[our website]: https://terraform-docs.io/
[User Guide]: https://terraform-docs.io/user-guide/introduction/

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_citrix"></a> [citrix](#requirement\_citrix) | = 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_citrix"></a> [citrix](#provider\_citrix) | 1.0.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [citrix_application.published_application](https://registry.terraform.io/providers/citrix/citrix/1.0.0/docs/resources/application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_citrix_application_command_line_arguments"></a> [citrix\_application\_command\_line\_arguments](#input\_citrix\_application\_command\_line\_arguments) | cmd arguments | `string` | n/a | yes |
| <a name="input_citrix_application_command_line_executable"></a> [citrix\_application\_command\_line\_executable](#input\_citrix\_application\_command\_line\_executable) | The command line executable | `string` | n/a | yes |
| <a name="input_citrix_application_description"></a> [citrix\_application\_description](#input\_citrix\_application\_description) | Application Description | `string` | n/a | yes |
| <a name="input_citrix_application_folder_path"></a> [citrix\_application\_folder\_path](#input\_citrix\_application\_folder\_path) | Citrix Application folder path | `string` | n/a | yes |
| <a name="input_citrix_application_name"></a> [citrix\_application\_name](#input\_citrix\_application\_name) | The name of the application | `string` | n/a | yes |
| <a name="input_citrix_application_published_name"></a> [citrix\_application\_published\_name](#input\_citrix\_application\_published\_name) | The name of the application | `string` | n/a | yes |
| <a name="input_citrix_application_visibility"></a> [citrix\_application\_visibility](#input\_citrix\_application\_visibility) | The visibility of the application | `list(string)` | n/a | yes |
| <a name="input_citrix_application_working_directory"></a> [citrix\_application\_working\_directory](#input\_citrix\_application\_working\_directory) | The working directory | `string` | n/a | yes |
| <a name="input_citrix_deliverygroup_name"></a> [citrix\_deliverygroup\_name](#input\_citrix\_deliverygroup\_name) | Delivery group | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_citrix_published_apllication_name"></a> [citrix\_published\_apllication\_name](#output\_citrix\_published\_apllication\_name) | Citrix Published Application Name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
