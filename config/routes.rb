Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions:           'users/sessions',
    registrations:      'users/registrations',
    confirmations:      'users/confirmations',
    passwords:          'users/passwords',
    unlocks:            'users/unlocks',
  }
  
  namespace :admin do
    resources :settings,
              only: [ :index, :create ] do

      collection do
        get :styles
      end
    end

    resources :pages,
              path: '/',
              only: [] do

      collection do
        get :dashboard
        get :utilities
      end
    end

    resources :users,
              only: [ :index ] do

      member do
        put :deactivate
        put :activate
      end
    end
  end

  root to: "pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
