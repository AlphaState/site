AlphaState::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    get '/', to: 'application#home', as: :home
    get '/manifesto', to: 'application#manifesto', as: :manifesto
    resources :posts, path: 'blog'
    resources :projects, path: 'portfolio'
  end

  match '*path', to: 'application#exception', via: :get
  root 'application#home'
end
