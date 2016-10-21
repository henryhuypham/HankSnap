Rails.application.routes.draw do
  get 'users/authenticate'

  root 'users#authenticate'
end
