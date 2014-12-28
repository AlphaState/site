set :stage, :production

role :web, 'ivan@site.alphastate.se'
server 'site.alphastate.se', user: 'ivan', roles: %w{web app}

set :deploy_to, '/home/ivan/projects/alpha-v1'

paths = [
  '/usr/local/rvm/rubies/ruby-2.2.0',
  '/usr/local/rvm/gems/ruby-2.2.0',
  '/usr/local/rvm/gems/ruby-2.2.0@global',
]

set :default_env, {
  GEM_HOME: '/usr/local/rvm/gems/ruby-2.2.0',
  GEM_PATH: '/usr/local/rvm/gems/ruby-2.2.0:/usr/local/rvm/gems/ruby-2.2.0@global',
  PATH: "#{paths.map{ |p| File.join(p, 'bin') }.join(':')}:$PATH",
}
