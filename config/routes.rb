Rails.application.routes.draw do
  get   'friendships/index', to: 'friendships#index'
  post  'friendships/create', to: 'friendships#create'
  post  'friendships/block', to: 'friendships#block'
  post  'friendships/remove', to: 'friendships#remove'

  get   'messages/inbox', to: 'messages#inbox'
  get   'messages/sent', to: 'messages#sent'
  get   'messages/compose', to: 'messages#compose'

  post  'sign_up', to: 'users#sign_up'
  post  'sign_in', to: 'users#sign_in'
  get   'sign_out', to: 'users#sign_out'

  root  'users#authenticate'
end
