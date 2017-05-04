Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :posts do
    resources :posts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :posts, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :posts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
