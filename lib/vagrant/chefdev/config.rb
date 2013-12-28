module Vagrant
  module Chefdev
    class Config < Vagrant.plugin('2', :config)

      attr_accessor :nuke_chef_node


      def initialize
        @nuke_chef_node = UNSET_VALUE
      end

      def finalize!
        @nuke_chef_node = true if @nuke_chef_node == UNSET_VALUE
      end

      
    end
  end
end
