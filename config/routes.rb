Rails.application.routes.draw do

  get('/about', {to: 'about#index' })
  get('/contact', {to: 'contact#index' })
  post('/contact', {to: 'contact#create', as: 'contact_submit' })

  # (HTTP Verb: delete - path: /questions/:id ) ==> questions controller / destroy action
  #
  # delete '/questions/:id', to: 'questions#destroy', as: 'question_deletion'

  

  root 'welcome#index'
end
