set :application, "hackfest"
set :repository, "git@github.com:m4risU/hackfest-project.git"
set :scm, :git
set :scm_user, "m4risu"

set :use_sudo, true
set :deploy_to, "/srv/hackfest/"

set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

server "redwarrior.pl", :app, :web, :db, :primary => true
set :rails_env, "production"
set :user, "rails"

after "deploy:update", "deploy:copy_yml_files"

deploy.task :copy_yml_files do
  run "ln -s /srv/hackfest/etc/config/database.yml /srv/hackfest/current/config/database.yml"
end

deploy.task :bundle do
  run "cd #{release_path}; sudo bundle install"
end

deploy.task :restart, :roles => :app do
  run "cd #{release_path}; sudo bundle install"
  run "cd #{release_path}; RAILS_ENV=#{rails_env} sudo bundle exec rake assets:precompile"
  run "sudo service thin_hf restart"
end
