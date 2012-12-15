name "ci_server_master"
description "CI Server master role, installs jenkins-ci and sonar source behind Ngix webserver for ssl"
all_env = [
  "recipe[base-chef]",
  "recipe[nginx]",
  "recipe[java]",
  "recipe[jenkins]",
  "recipe[ci_server]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "Live"     => all_env,
  "dev"      => all_env
)

default_attributes(
  "jenkins" => {
    "http_proxy" => {
    }
  },
  "nginx" => {
    "default_site_enabled" => false
  }
)