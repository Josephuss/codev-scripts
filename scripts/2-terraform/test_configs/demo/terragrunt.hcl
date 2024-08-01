terraform {
  source = "${local.root_deployments_dir}../../..//modules/${local.source_deployment_name}"
}
skip = true

locals {

  # The name of the directory we're in 
  raw_source_deployment_name = basename(abspath(path_relative_to_include()))

  # What directory do we look up in terraform-catalog - usually the same name as the local directory
  source_deployment_name = local.raw_source_deployment_name

  # This gives overridable inheritance of vars via tfvars.yaml
  # Inspired by https://www.bti360.com/creating-a-terraform-variable-hierarchy-with-terragrunt/
  root_deployments_dir       = get_parent_terragrunt_dir()
  relative_deployment_path   = path_relative_to_include()
  deployment_path_components = compact(split("/", local.relative_deployment_path))
  # Get a list of every path between root_deployments_directory and the path of
  # the deployment
  possible_config_dirs = [
    for i in range(0, length(local.deployment_path_components) + 1) :
    join("/", concat(
      [local.root_deployments_dir],
      slice(local.deployment_path_components, 0, i)
    ))
  ]
  # Generate a list of possible config files at every possible_config_dir
  # (support both .yml and .yaml)
  possible_config_paths = flatten([
    for dir in local.possible_config_dirs : [
      "${dir}/tfvars.yml",
      "${dir}/tfvars.yaml"
    ]
  ])
  # Load every YAML config file that exists into an HCL object
  file_configs = [
    for path in local.possible_config_paths :
    yamldecode(file(path)) if fileexists(path)
  ]
  # Merge the objects together, with deeper configs overriding higher configs
  merged_config = merge(local.file_configs...)
}
inputs = local.merged_config
