# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "hitesha"
client_key               "#{current_dir}/hitesha.pem"
validation_client_name   "hitesh-test-validator"
validation_key           "#{current_dir}/hitesh-test-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/hitesh-test"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:secret_file] = "/root/.chef/encrypted_data_bag_secret"
