Apitite::Application.routes.draw do
  resources :places
  root "places#index"
end
