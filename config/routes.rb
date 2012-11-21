Myapp::Application.routes.draw do
  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  match '/howitworks', 	to: 'home#howitworks'
  match '/givingback', 	to: 'home#givingback'
  match '/featuredprofessionals', to: 'home#featuredprofessionals'
  match '/about', 		to: 'home#about'
  match '/contact', 	to: 'home#contact'
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
end