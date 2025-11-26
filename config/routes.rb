Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  root "pages#home"
  get "about", to: "pages#about", as: :about
  get "contact", to: "pages#contact", as: :contact

  get "articles", to: "articles#index", as: :all_articles
  get "articles/new", to: "articles#new", as: :new_article
  post "articles", to: "articles#create"
  get "articles/:id", to: "articles#show", as: :article
  get "articles/:id/edit", to: "articles#edit", as: :edit_article
  patch "articles/:id", to: "articles#update"
  delete "articles/:id", to: "articles#destroy"
  post "articles/:id/publish", to: "articles#publish", as: :publish_article

  # Defines the root path route ("/")
  # root "posts#index"
end
