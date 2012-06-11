MODE = "staging"
PRODUCTION_SERVER = "fallingfoundry.com"
STAGING_SERVER = "2.2.2.2"
SERVER = MODE == "production" ? PRODUCTION_SERVER : STAGING_SERVER


PRODUCTION_PORT = ":80"
STAGING_PORT = ":3000"
PORT = MODE == "production" ? PRODUCTION_PORT : STAGING_PORT


$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
 require 'bundler/capistrano'
 require 'rvm/capistrano'
server SERVER, :web, :db, :app, primary: true
set :user, "deployer"
set :application, "Chatbot"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true

set :scm, "git"
set :repository,  "git@github.com:HungryAcademyTeam4/Chatbot.git"
set :branch, "faye"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  task :bundle_install do
    run "cd /home/#{user}/apps/#{application}/current && bundle install"
  end
  task :create_release_log do
    run <<-CMD
    rm -rf #{latest_release}/log #{latest_release}/public/system #{latest_release}/tmp/pids &&
    mkdir -p #{latest_release}/public &&
    mkdir -p #{latest_release}/tmp &&
    ln -s #{shared_path}/log #{latest_release}/log &&
    ln -s #{shared_path}/system #{latest_release}/public/system &&
    ln -s #{shared_path}/pids #{latest_release}/tmp/pids
    CMD
  end
  task :start do
    run "cd /home/#{user}/apps/#{application}/current && RAILS_ENV=production bundle exec rake db:create && bundle exec rake db:migrate"
    run "cd /home/#{user}/apps/#{application}/current && RAILS_ENV=production bundle exec unicorn -p 3000"
  end
  after "deploy", "deploy:create_release_log"
  after "deploy", "deploy:start"
end