Rails.application.routes.draw do

  resources :sessions
  get 'logout', to: 'sessions#logout', as: :logout

  root 'daily_report#show'
  post 'daily_report', to: 'daily_report#create'

  get 'daily_report', to: 'daily_report#show'
  get 'backlog', to: 'backlog#show'
  get 'gantt', to: 'gantt#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
