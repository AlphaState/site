lock '3.3.5'

set :application, 'alpha'
set :repo_url, 'git@github.com:AlphaState/site.git'

namespace :deploy do
  desc 'Configure the application'
  task :configure do
    on roles(:all) do
      %w{database secrets}.each do |name|
        execute "rm -f #{release_path}/config/#{name}.yml"
        execute "ln -s #{deploy_to}/shared/config/#{name}.yml #{release_path}/config/#{name}.yml"
      end
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
