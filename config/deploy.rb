set :application, "loo"
set :domain, "loo.barouf.info"
set :user, "barouf"
set :applicationdir, "/home/#{user}/#{domain}"

set :scm, :git
set :scm_command, "~/packages/bin/git" #updated version of git on server in user directory
set :local_scm_command, "/usr/local/git/bin/git" #correct path to local  git
set :use_sudo, false
set :chmod755, "app config db lib public vendor script script/* public/disp*"

set :repository,  "git@github.com:franck/loo.git"
set :branch, "master"
set :deploy_to, applicationdir
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true


role :app, "loo.barouf.info"
role :web, "loo.barouf.info"
role :db, "loo.barouf.info", :primary => true

#desc "Restarting after deployment"
#task :after_deploy, :roles => [:app, :db, :web] do
# run "sed 's/# ENV\\[/ENV\\[/g' #{deploy_to}/current/config/environment.rb > #{deploy_to}/current/config/environment.temp"
# run "mv #{deploy_to}/current/config/environment.temp #{deploy_to}/current/config/environment.rb"
#end


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end