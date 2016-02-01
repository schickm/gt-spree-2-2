VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = "debian/jessie64"
  config.vm.box_version = "8.2.1"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # not sure why this is required, but docker provision
  # blows up if it doesn't happen before hand
  config.vm.provision "shell",
    inline: "sudo apt-get install apt-transport-https"

  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t gt-spree-test"
    d.run "gt-spree-test", args: "-p 3000:3000"
  end

  config.vm.synced_folder ".", "/vagrant"
end
