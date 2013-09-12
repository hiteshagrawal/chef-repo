#
# Cookbook Name:: aliases
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Alias `h` to go home
magic_shell_alias 'h' do
  command 'cd ~'
end

# Alias `sites` to cd into apache
#magic_shell_alias 'sites' do
#  command "cd #{node['apache']['dir']}/sites-enabled"
#end

# Set Nano as the default editor
magic_shell_environment 'EDITOR' do
  value 'nano'
end

template "/etc/motd" do 
source "motd.erb"
owner "root" 
group "root" 
mode "0644"
end

package "audit" do
package_name "audit"
action:install
end


service "auditd" do
action:restart
end

#Running Bash commands
#execute "downloading_likewiseopen" do
#cwd "/root/likewise-setup/"
#command "wget http://www.likewise.com/bits/6.1/8667/LikewiseOpen-6.1.0.8667-linux-x86_64-rpm.sh"
#end


node[:dumpdir] = "/etc/yum.repos.d/dump"
directory node[:dumpdir] do
mode 0755
owner "root"
group "root"
action:create
end
