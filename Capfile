require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/puma'
require 'capistrano/bundler'
require 'capistrano/rvm'

install_plugin Capistrano::Puma, load_hooks: false  # Default puma tasks without hooks
install_plugin Capistrano::Puma::Monit, load_hooks: false  # Monit tasks without hooks

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }