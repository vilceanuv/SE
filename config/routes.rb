Rails.application.routes.draw do

  get 'questions/next_question', to: 'questions#next_question'
	
  resources :questions
  resources :celebrities
  root 'celebrities#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
