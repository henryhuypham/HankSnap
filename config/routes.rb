Rails.application.routes.draw do
  post  'sign_up', to: 'users#sign_up'
  post  'sign_in', to: 'users#sign_in'

  root  'users#authenticate'
end
