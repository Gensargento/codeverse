 Rails.application.routes.draw do
   resources :lessons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    # Defines the root path route ("/")
  # root "articles#index"
  get "about", to: "pages#about"
  get "dashboard", to: "lessons#dashboard"
  get "show_lessons", to: "lessons#show_lessons"
  authenticated :user do
     root to: 'lessons#dashboard', as: :authenticated_root
  end
  root "pages#home"
  resources :posts
end
