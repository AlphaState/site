set :stage, :production

role :web, 'ivan@site.alphastate.se'
server 'site.alphastate.se', user: 'ivan', roles: %w{web app}

set :deploy_to, '/home/ivan/projects/alpha-v2'
