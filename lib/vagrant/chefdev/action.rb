require 'vagrant/chefdev/action/delete_chef_client'
require 'vagrant/chefdev/action/delete_chef_node'

module Vagrant
  module Chefdev
    module Action
      include Vagrant::Action::Builtin


      def self.delete_chef_node
        Vagrant::Action::Builder.new.tap do |builder|
          builder.use ConfigValidate
          builder.use DeleteChefNode
        end
      end


      def self.delete_chef_client
        Vagrant::Action::Builder.new.tap do |builder|
          builder.use ConfigValidate
          builder.use DeleteChefClient
        end
      end

    end
  end
end
