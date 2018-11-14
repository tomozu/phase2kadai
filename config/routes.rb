Rails.application.routes.draw do
  root to: 'tops#index'
  resources :talks do
    collection do
      post :confirm
    end
  end
end