Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'info#index'

  get :discounts, to: 'discounts#calculate'
end
