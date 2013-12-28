module Vagrant
  module Chefdev
    module Action
      class DeleteChefClient
        
        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = @machine.provider_name
          @logger = Log4r::Logger.new('vagrant::chefdev::delete_chef_client')
        end

        def call(env)
          # skip if machine is not active on destroy action
          return @app.call(env) if !@machine.id && env[:machine_action] == :destroy

          # check config to see if the chef server is provided
          return @app.call(env) if @global_env.config_global.chefdev.chef_server.nil?

          # Delete chef Node
          @logger.info 'Deleting chef  client'
       
          if @machine.config.chefdev.nuke_chef_node
            machine = @global_env.machine(@global_env.config_global.chefdev.chef_server, p)
            machine.communicate("knife client delete -y #{@machine.name}")
          end
          @app.call(env)
        end
        
      end
    end
  end
end
