

#*** rails g clearance:routes show all these default Clearance routes

Rails.application.routes.draw do

  root 'welcome#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users", only: [:show, :edit, :update, :destroy]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


resources :listings

resources :listings do 
  resources :reservations, except: [:index]
end

resources :reservations, only: [:index]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  #*** end of default routes of Clearance

resources :payments, only: [:new, :create]


get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
