AlphaState::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    get '/', to: 'application#home', as: :home
    get '/manifesto', to: 'application#manifesto', as: :manifesto
    get '/blog', to: 'application#blog', as: :blog
  end

  match '*path', to: 'application#home', via: :get
  root 'application#home'
end
