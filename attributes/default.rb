# java
default['java']['jdk_version'] = '7'

# jenkins
default['jenkins']['apt_uri'] = 'http://pkg.jenkins-ci.org/debian binary/'
default['jenkins']['apt_key'] = 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key'
default['jenkins']['yum_baseurl'] = 'http://pkg.jenkins-ci.org/redhat'
default['jenkins']['yum_gpgkey'] = 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
default['jenkins']['ubuntu_setting_path'] = '/etc/default/jenkins'
default['jenkins']['centos'] = '/etc/sysconfig/jenkins'
