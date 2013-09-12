%w{sites-available sites-enabled mods-available mods-enabled}.each do |dir|
directory "/tmp/#{dir}" do
mode 0755
owner "root"
group "root"
action :create
end
end
