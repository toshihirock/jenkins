# install java
case node['platform']
when 'ubuntu'
  execute "apt-get update" do
    command "apt-get update"
  end
when 'centos'
  execute "yum update" do
    command "yum update -y"
  end
end
include_recipe 'java'

# add package control
case node['platform']
when 'ubuntu'
  apt_repository 'jenkins' do
    uri node['jenkins']['apt_uri']
    key node['jenkins']['apt_key']
    action :add
  end
when 'centos'
  yum_repository 'jenkins.repo' do
    baseurl node['jenkins']['yum_baseurl']
    description 'jenkins'
    gpgkey node['jenkins']['yum_gpgkey']
    action :create
  end
end

# install jenkins
package 'jenkins'

# start jenkins
service 'jenkins' do
  action [ :enable, :start ]
end

# move to jennkins setting file
cookbook_file 'jenkins' do
  case node['platform']
  when 'ubuntu'
    path node['jenkins']['ubuntu_setting_path']
  else
    path node['jenkins']['centos_setting_path']
  end
  action :create
  notifies :reload, 'service[jenkins]'
end
