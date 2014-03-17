AlphaState::Application.routes.draw do
  get '/manifesto', to: 'application#manifesto'
  match '*path', to: 'application#home', via: :get
  root 'application#home'
end
