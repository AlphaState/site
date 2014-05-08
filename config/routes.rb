AlphaState::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    get '/', to: 'application#home', as: :home
    get '/manifesto', to: 'application#manifesto', as: :manifesto

    resources :posts, path: 'blog'
    resources :projects, path: 'portfolio'

    match '/*path', to: 'application#page_not_found', via: :get
  end

  root 'application#home'
end
