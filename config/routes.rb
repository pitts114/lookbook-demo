Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "showcase#index"
  get "showcase/kitchen_sink", to: "showcase#kitchen_sink"
end
