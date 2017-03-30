Rails.application.routes.draw do

  get('/about', {to: 'about#index' })
  get('/contact', {to: 'contact#index' })
  post('/contact', {to: 'contact#create', as: 'contact_submit' })


  # delete '/questions/:id', to: 'questions#destroy', as: 'question_deletion'
  # get '/questions/:id/edit', to: 'questions#edit', as 'question_edit'
  # get '/questions/:id', to: 'questions#show', as 'question_show'
  # post '/questions/:id/comments', to: 'comment#create', as 'comments'
  # get '/faq', to: 'home#faq', as: 'faq'

  root 'welcome#index'

end
