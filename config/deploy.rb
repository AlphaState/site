lock '3.1.0'

set :application, 'alpha'
set :repo_url, 'gitolite@ukhov.me:web/alpha.git'

namespace :deploy do
  desc 'Configure the application'
  task :configure do
    on roles(:app) do
      execute "ln -s #{ deploy_to }/shared/config/database.yml #{ release_path }/config/database.yml"
    end
  end

  desc 'Restart the application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  before 'deploy:assets:precompile', 'deploy:configure'
  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'
end
