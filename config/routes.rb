Rails.application.routes.draw do
  resources :blogs do
    resources :entries, except: :index
  end
end
