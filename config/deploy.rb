lock '3.3.5'

set :application, 'alpha'
set :repo_url, 'git@code.alphastate.se:web/alpha.git'
set :branch, 'v1'

namespace :deploy do
  desc 'Configure the application'
  task :configure do
    on roles(:all) do
      execute "ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    end
  end

  desc 'Restart the application'
  task :restart do
    on roles(:all), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  before 'deploy:assets:precompile', 'deploy:configure'
  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'
end
