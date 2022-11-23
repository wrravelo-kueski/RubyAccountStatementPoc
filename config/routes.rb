Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :finance_products do
    get :transactions, on: :member
  end
end
