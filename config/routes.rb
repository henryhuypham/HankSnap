Rails.application.routes.draw do
  get   'messages/inbox', to: 'messages#inbox'
  get   'messages/sent', to: 'messages#sent'
  get   'messages/new', to: 'messages#new'

  post  'sign_up', to: 'users#sign_up'
  post  'sign_in', to: 'users#sign_in'
  get   'sign_out', to: 'users#sign_out'

  root  'users#authenticate'
end
