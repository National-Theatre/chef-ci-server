name "CI Server Master"
description "CI Server master role, installs jenkins-ci and sonar source behind Ngix webserver for ssl"
all_env = [
  "recipe[base-chef]",
  "recipe[chef-jenkins]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "Live"     => all_env,
  "dev"      => all_env,
)