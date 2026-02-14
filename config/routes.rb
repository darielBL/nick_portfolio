Rails.application.routes.draw do
  # Página principal - Single Page Application
  root 'home#index'

  # Rutas para Turbo (cambios de sección sin recargar)
  get 'portfolio', to: 'home#portfolio'
  get 'personal', to: 'home#personal'
  get 'about', to: 'home#about'

  # Autenticación (acceso oculto)
  resource :session, only: [:new, :create, :destroy]


  # Dashboard Admin (protegido)
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    patch 'about', to: 'dashboard#update_about'
    resources :portfolio_images, only: [:create, :destroy]
    resources :personal_works, only: [:create, :destroy]
    # Redes sociales - CRUD completo
    resources :social_links, only: [:create, :destroy]
    patch 'social_links', to: 'social_links#update_all'
  end
end