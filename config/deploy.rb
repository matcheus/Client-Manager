# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "client_manager"
set :repo_url, "git@github.com:matcheus/Client-Manager.git"

set :passenger_restart_with_touch, true

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/client-manager"
# Default value for :format is :airbrussh.
# set :format, :airbrussh
set :rvm1_map_bins, %w{rake gem bundle ruby}

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
