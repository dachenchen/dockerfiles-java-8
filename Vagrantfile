# -*- mode: ruby -*-
# vi: set ft=ruby :

types    = [ "jdk" , "jre" , "server-jre" ]
versions = [ "8u00" , "8u05" , "8u11" , "8u20" , "8u25" , "8u31" ]

Vagrant.configure("2") do |config|

	config.vm.box = "chef/ubuntu-14.10"

  types.each do |type|
    versions.each do |version|
		  jvm = "%s-%s" % [type,version]
      config.vm.provision "docker" do |d|
        d.build_image "/vagrant/#{jvm}"
      end
    end
  end

end
