Rails.application.routes.draw do
  resources :working_days
  root 'welcome#index'

  resources :sessions
  get 'logout', to: 'sessions#logout', as: :logout

  get 'daily_report', to: 'daily_report#show', as: :daily_report
  get 'backlog', to: 'backlog#show', as: :backlog
  get 'timeline', to: 'gantt#show', as: :timeline

  resource :working_days

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
