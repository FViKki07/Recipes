Rails.application.routes.draw do
   root "welcome#index"
   resources :recipes
   resources :users, only: %i[new create edit update destroy show]
   resource :session, only: %i[new create destroy]
   
end
