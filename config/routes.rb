Rails.application.routes.draw do

  get('/about', {to: 'about#index' })
  get('/contact', {to: 'contact#index' })
  post('/contact', {to: 'contact#create', as: 'contact_submit' })

  resources :products
  # get('/products/new', { to: 'products#new', as: 'new_product' })
  # post('/products', { to: 'products#create', as: 'products' })

  root 'welcome#index'

end
