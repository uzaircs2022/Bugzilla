Rails.application.routes.draw do

  resources :projects do
    resources :bugs
  end

  root 'dashboards#home'
  post '/projects/:project_id/bugs/:id', to: 'bugs#bug_assignment', as: :assign
  post '/projects/:project_id/bugs/:id/status', to: 'bugs#status', as: :status

  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }

end
