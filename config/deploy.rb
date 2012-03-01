set :application, "ticketee"
set :repository,  "git@github.com:tuefelsdrock/ticketee.git"
set :branch, "ch11"

set :scm, :git

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "target"
set :deploy_to, "/home/target/apps/#{application}"

set :use_sudo, false

set :keep_releases, 5


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
