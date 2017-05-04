module Refinery
  module Works
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Works

      engine_name :refinery_works

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "works"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.works_admin_works_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Works)
      end
    end
  end
end
