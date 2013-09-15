#
# Cookbook Name:: mount
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/tmp/tmpfs" do
mode 0755
owner "root"
group "root"
action :create
end

mount "/tmp/tmpfs" do
  pass     0
  fstype   "tmpfs"
  device   "/dev/null"
  options  "nr_inodes=999k,mode=755,size=500m"
  action   [:mount, :enable]
end
