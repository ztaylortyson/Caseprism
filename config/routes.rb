Rails.application.routes.draw do
  resources :attorneys
  
  root 'pages#home'
  get 'dash', to: 'pages#dash'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'displays', to: 'displays#show'
  get 'newcasefilings', to: 'case_search#ncfs'
end


