require 'vagrant/chefdev/action'

module Vagrant
  module Chefdev
    class Plugin < Vagrant.plugin('2')
      name 'ChefDev'
      description <<-DESC
        This plugin manages the chef node and clients  
      DESC

      config(:chefdev) do
        require_relative 'config'
        Config
      end


      action_hook(:chefdev, :machine_action_destroy) do |hook|
        hook.prepend(Action.delete_chef_node)
        hook.prepend(Action.delete_chef_client)
      end


    end
  end 
end
