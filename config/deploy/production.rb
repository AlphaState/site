set :stage, :production

role :web, 'ivan@alphastate.se'
server 'alphastate.se', user: 'ivan', roles: %w{web app}

set :deploy_to, '/home/ivan/projects/alpha-v2'

paths = [
  '/usr/local/rvm/rubies/ruby-2.1.5',
  '/usr/local/rvm/gems/ruby-2.1.5',
  '/usr/local/rvm/gems/ruby-2.1.5@global',
]

set :default_env, {
  GEM_HOME: '/usr/local/rvm/gems/ruby-2.1.5',
  GEM_PATH: '/usr/local/rvm/gems/ruby-2.1.5:/usr/local/rvm/gems/ruby-2.1.5@global',
  PATH: "#{paths.map{ |p| File.join(p, 'bin') }.join(':')}:$PATH",
}
