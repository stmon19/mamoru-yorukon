Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :contacts do
    resource :contacts, :path => '', :only => [:new, :create]
  end

  # Admin routes
  namespace :contacts, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :contacts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
