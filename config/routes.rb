Rails.application.routes.draw do
  mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?

  get "up" => "rails/health#show", as: :rails_health_check

  root "showcase#index"
  get "showcase/kitchen_sink", to: "showcase#kitchen_sink"

  resources :modals, only: :show
end
