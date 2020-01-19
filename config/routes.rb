Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flowers
  resources :compositions do
    resources :proportions
  end
  resources :orders do
    resources :quantities
    collection do
      get 'show_by_date'
    end
  end
end
