{
  "name": "test",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": [
    "recipe[aliases::directory]",
    "recipe[aliases::default]",
    "recipe[databag-test]",
    "recipe[databag-test::test-example-com]"
  ],
  "env_run_lists": {
  }
}
