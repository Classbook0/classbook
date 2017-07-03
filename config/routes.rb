Rails.application.routes.draw do
  root 'inicio#index'
  resources :inicio, only: [:index]
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :dudas
  resources :eventos
  resources :convenios
  resources :tallerculturales
  resources :tallerdeportivos
  resources :reunionapoderados
  resources :cursos do
    resources :notes
  end
  post 'notes/crear/generar/', to: 'notes#generar'
end
