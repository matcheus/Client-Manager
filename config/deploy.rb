# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "client_manager"
set :repo_url, "git@github.com:matcheus/Client-Manager.git"

set :passenger_restart_with_touch, true

set :puma_threads,    [4, 16]

set :deploy_to, "/home/deployer/client_manager"
set :rvm1_map_bins, %w{rake gem bundle ruby}

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
