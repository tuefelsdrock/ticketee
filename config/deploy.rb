
# the following is required for using a private rvm environment
#
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_type, :user  # use the deploying account rvm

require 'bundler/capistrano'

set :application, "ticketee"
set :repository,  "git@github.com:tuefelsdrock/ticketee.git"
set :branch, "ch14"

set :scm, :git

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

# I used the account target instead of ticketeeapp.com 
set :user, "target"
set :deploy_to, "/home/target/apps/#{application}"

set :use_sudo, false

set :keep_releases, 5

# complains about public/images etc, which are not in github, so disable the touch step:
set :normalize_asset_timestamps, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

task :symlink_database_yml do
  run "rm #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/database.yml
       #{release_path}/config/database.yml"
end
after "bundle:install", "symlink_database_yml"

