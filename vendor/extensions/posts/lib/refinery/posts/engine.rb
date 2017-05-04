module Refinery
  module Posts
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Posts

      engine_name :refinery_posts

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "posts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.posts_admin_posts_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Posts)
      end
    end
  end
end
