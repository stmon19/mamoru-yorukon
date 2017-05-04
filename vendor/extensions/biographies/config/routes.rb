Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :biographies do
    resource :biographies, :path => '', :only => [:show]
  end

  # Admin routes
  namespace :biographies, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :biographies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
