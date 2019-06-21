Rails.application.routes.draw do
  #devise_for :users
  root to: "home#top"
  get  '/about', to: 'home#about'
  
  get 'home/show' 
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
