Rails.application.routes.draw do
   root "welcome#index"
   resources :users, only: %i[new create edit update destroy]
   resource :session, only: %i[new create destroy]
   
end
