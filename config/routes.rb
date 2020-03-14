Rails.application.routes.draw do
  devise_for :users
  resources :answers
  resources :questions
  root to: "questions#index"
  #match "questions/follow" => "questions#follow", :via => [:get, :post] , as: "follow"
  match 'follow', to: 'questions#follow', via: [:get, :post]
  # post "questions#follow"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
