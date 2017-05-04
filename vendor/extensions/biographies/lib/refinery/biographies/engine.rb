module Refinery
  module Biographies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Biographies

      engine_name :refinery_biographies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "biographies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.biographies_admin_biographies_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Biographies)
      end
    end
  end
end
