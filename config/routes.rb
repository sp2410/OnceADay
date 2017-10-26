Rails.application.routes.draw do
    
  devise_for :users
  resources :subjects do 
  	resources :posts do

      resources :sections

  		resources :videos
		resources :audios
		resources :codes
		resources :paragraphs
		resources :pictures

  	end
  end

  match '/myposts', to: "subjects#myposts", via: :get
  match '/home', to: "subjects#home", via: :get

  root "subjects#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
