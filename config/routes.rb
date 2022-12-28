Rails.application.routes.draw do
   root "welcome#index"
   resources :recipes
   resources :users, only: %i[new create]
   resource :session, only: %i[new create destroy]
   
end
