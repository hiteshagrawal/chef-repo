#
# Cookbook Name:: databag-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# This is where you will store a copy of your key on the chef-client
secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")
 
# This decrypts the data bag contents of "mysecrets->marioworld" and uses the key defined at variable "secret"
luigi_keys = Chef::EncryptedDataBagItem.load("mysecrets", "marioworld", secret)
 
template "/tmp/databag" do
     variables(:mypass => luigi_keys['pass'],
               :myuser => luigi_keys['user'])
     owner "root"
     mode  "0644"
     source "databag_test.erb"
end
