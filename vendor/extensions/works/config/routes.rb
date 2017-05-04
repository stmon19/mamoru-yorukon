Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :works do
    resources :works, path: '', only: [:index]
  end

  # Admin routes
  namespace :works, path: '' do
    namespace :admin, path: Refinery::Core.backend_route do
      resources :works, except: :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
