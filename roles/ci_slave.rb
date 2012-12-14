name "CI Server Slave"
description "CI Server slave role, installs jenkins-ci slave and lamp stack"
all_env = [
  "role[webserver]",
  "recipe[chef-jenkins::node_jnlp]",
  "recipe[chef-client]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "Live"     => all_env,
  "dev"      => all_env,
)