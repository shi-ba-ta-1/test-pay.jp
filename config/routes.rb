Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'credits#show'

  resources :credits do
    collection do
      get :pay
    end
  end
  
end
