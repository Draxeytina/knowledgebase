Rails.application.routes.draw do
  resources :trends
  resources :articles

  root "articles#index"
end
