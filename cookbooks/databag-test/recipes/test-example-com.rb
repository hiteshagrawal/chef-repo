#
# Cookbook Name:: databag-test
# Recipe:: test-example-com
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# This is where you will store a copy of your key on the chef-client
secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")
 
# This decrypts the data bag contents of "mysecrets->marioworld" and uses the key defined at variable "secret"
certificate_crt = Chef::EncryptedDataBagItem.load("mysecrets", "test-example-com", secret)
 
template "/etc/ssl/certs/mysitename.crt" do
     variables(:ssl_cert => certificate_crt['public_key'])
     owner "root"
     mode  "0644"
     source "certificate_crt.erb"
#     action :create
end

template "/etc/ssl/certs/mysitename.key" do
     variables(:ssl_cert => certificate_crt['private_key'])
     owner "root"
     mode  "0644"
     source "certificate_key.erb"
#     action :create
end
