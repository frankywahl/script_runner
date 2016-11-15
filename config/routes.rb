ScriptRunner::Engine.routes.draw do
  resources :jobs, only: %i(index new create)
  root to: 'jobs#index'
end
