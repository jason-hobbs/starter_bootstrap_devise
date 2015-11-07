Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", :passwords => "passwords" }
  root 'pages#home'
end
