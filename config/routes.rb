Rails.application.routes.draw do
  devise_for :users, :controllers => {registerations: "registerations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :hospital do
    resources :treatment do
      resources :price
    end
  end

  resources :request

  get '/hospital/:hospital_id/treatment/:id/user/:uid', to: "treatment#assignuser"
  patch '/hospital/:hospital_id/treatment/:id/price', controller: 'price', action: :create

end
