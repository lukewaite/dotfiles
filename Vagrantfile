Vagrant::Config.run do |config|
  config.vm.share_folder "v-dotfiles", "/home/vagrant/.dotfiles", File.expand_path("~/.dotfiles")
  config.vm.share_folder "v-antigen", "/home/vagrant/.antigen", File.expand_path("~/.antigen")
  config.vm.provision :shell, :path => File.join(File.dirname(__FILE__), "scripts", "provision")
end
