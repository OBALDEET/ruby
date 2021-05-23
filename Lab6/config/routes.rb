Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  resources :posts do
    resources :marks
  end

end
