Rails.application.routes.draw do

  get('/about', {to: 'about#index' })
  get('/dashboard', {to: 'admin/dashboard#index' })
  get('/contact', {to: 'contact#index' })
  post('/contact', {to: 'contact#create', as: 'contact_submit' })

  resources :products do
    resources :reviews, only: [:create, :destroy, :show] do
      resources :likes, only: [:create, :destroy]
    end
    # get('/products/new', { to: 'products#new', as: 'new_product' })
    # post('/products', { to: 'products#create', as: 'products' })
  end



  resources :users, only: [:new, :create] do
    resources :likes, only: [:index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'welcome#index'

end
