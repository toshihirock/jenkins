# install java
case node['platform']
when 'ubuntu'
  execute "apt-get update" do
    command "apt-get update"
  end
end
include_recipe 'java'

# add package control
case node['platform']
when 'ubuntu'
  apt_repository 'jenkins' do
    uri 'http://pkg.jenkins-ci.org/debian binary/'
    key 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key'
    action :add
  end
  #notifies :run, "execute[apt-get update"]
when 'centos'
  yum_repository 'jenkins.repo' do
    baseurl 'http://pkg.jenkins-ci.org/redhat'
    description 'jenkins'
    gpgkey 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
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
cookbook_file "jenkins" do
  case node['platform']
  when 'ubuntu'
    path '/etc/default/jenkins'
  else
    path '/etc/sysconfig/jenkins'
  end
  action :create
  notifies :reload, 'service[jenkins]'
end
