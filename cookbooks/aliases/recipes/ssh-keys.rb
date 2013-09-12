group "deploy" do
    gid 123
end

if node[:user] == "vagrant"

    user "vagrant" do
        group "deploy"
    end

    template "/home/vagrant/.bashrc" do
        source "bashrc.erb"
        owner "vagrant"
    end

end

node[:users].each do |u|
    user u[:name] do
        username u[:name]
        shell "/bin/bash"
        home "/home/#{u[:name]}"
        group "deploy"
    end

    directory "/home/#{u[:name]}" do
        owner u[:name]
        group "deploy"
        mode 0700
    end

    directory "/home/#{u[:name]}/.ssh" do
        owner u[:name]
        group "deploy"
        mode 0700
    end

    template "/home/#{u[:name]}/.bashrc" do
        source "bashrc.erb"
        owner u[:name]
        mode 0700
    end

    cookbook_file "/home/#{u[:name]}/.profile" do
        source "profile"
        owner u[:name]
        mode 0700
    end

    execute "authorized keys" do
        command "echo #{u[:key]} > /home/#{u[:name]}/.ssh/authorized_keys"
    end
end
