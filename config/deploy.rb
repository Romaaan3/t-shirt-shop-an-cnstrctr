require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :user, 'gp'
set :domain, 'goprint.by'
set :deploy_to, '/home/gp/web-apps/goprint.by'
set :repository, 'git@bitbucket.org:kklochkov/goprint-rails-5.git'
set :branch, 'master'
set :rails_env, 'production'
set :term_mode, nil
set :rvm_path, '/usr/local/rvm/scripts/rvm'

set :shared_paths, ['config/puma.rb', 'config/database.yml', 'config/secrets.yml', 'log', 'public/system']

task :environment do
  invoke :'rvm:use[ruby-2.3.1]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/public/system"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/system"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/puma.rb"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml', 'secrets.yml and 'puma.rb'."]

  if repository
    repo_host = repository.split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(repository) && /:([0-9]+)/.match(repository)[1] || '22'
  end
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'

    queue "bundle install --path='./gems/' --local"
    queue "bundle exec rake db:migrate RAILS_ENV=production"
    queue "bundle exec rake assets:precompile RAILS_ENV=production"
    queue "bundle exec rake assets:clean RAILS_ENV=production"
    # invoke :'rails:assets_precompile'
    # invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers
