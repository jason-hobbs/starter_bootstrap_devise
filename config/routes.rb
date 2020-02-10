Rails.application.routes.draw do
  resource :two_factor
  devise_for :users, controllers: { registrations: "registrations", :passwords => "passwords" }
  root 'pages#home'
  get 'admin/confirm' => 'admin#confirm'
  get 'admin/unlock' => 'admin#unlock'
  resources :admin
  #get 'admin' => 'admin#index'
  #get 'admin/edit' => 'admin#edit'
  #patch 'admin/edit' => 'admin#update'
  #delete 'admin/edit' => 'admin#destroy'
  
end
