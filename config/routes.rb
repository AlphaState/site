AlphaState::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    get '/', to: 'application#home', as: :home
    get '/manifesto', to: 'application#manifesto', as: :manifesto
    resources :posts, :path => 'blog'
  end

  match '*path', to: 'application#home', via: :get
  root 'application#home'
end
