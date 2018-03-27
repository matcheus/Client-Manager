# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "Client-Manager"
set :repo_url, "git@github.com:matcheus/Client-Manager.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/client-manager"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

set :linked_files, fetch(:linked_files, []).push('.env')

set :scm, :git

set :pty, true

set :keep_releases, 5

namespace :deploy do

  task :cleanup_assets do
    on roles :all do
      execute "cd #{release_path}/ && ~/.rvm/bin/rvm default do bundle exec rake assets:clobber RAILS_ENV=#{fetch(:stage)}"
    end
  end

  before :updated, :cleanup_assets
end
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
