AlphaState::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    get '/', to: 'application#home'
    get '/manifesto', to: 'application#manifesto'
  end

  match '*path', to: 'application#home', via: :get
  root 'application#home'
end
