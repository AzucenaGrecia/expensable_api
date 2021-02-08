Rails.application.routes.draw do
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/signup' => 'users#create'
  get '/profile' => 'users#show'
  patch '/profile' => 'users#update'
  delete '/profile' => 'users#destroy'
  resources :categories, except: %i[new edit] do
    resources :transactions, except: %i[new edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
