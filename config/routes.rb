Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", :passwords => "passwords" }
  root 'pages#home'
  get "admin" => "admin#index"
  get "admin/edit" => "admin#edit"
  post 'admin/edit' => 'admin#update'
end
